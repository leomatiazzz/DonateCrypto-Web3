// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// define a versão mínima do compilador Solidity.

struct Campaign {
    address author; // dono da campanha
    string title;
    string description;
    string videoUrl;
    string imageUrl; // de title até imageUrl -> dados da campanha
    uint256 balance; // saldo atual
    bool active; // status (ativa ou encerrada)
    uint256 supporterCount; // número de apoiadores únicos (via hasDonated)
}

contract DonateCrypto {
    address public owner; // endereço do administrador da plataforma
    uint256 public fee = 100; // wei -> taxa de retirada (em wei) para a plataforma
    uint256 public nextId = 0; // usado para gerar o próximo ID de campanha
    uint256[] public campaignIds; //  lista dos IDs criados (ajuda a acessar as campanhas em ordem)

    mapping(uint256 => Campaign) public campaigns; // id => campanha
    mapping(uint256 => mapping(address => bool)) public hasDonated; // id => (user => doou ou não)

    constructor() {
        owner = msg.sender; // define o criador do contrato como o administrador da plataforma
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only admin can call this."); // restringe o uso de funções ao admin da plataforma
        _;
    }

    function addCampaign( // permite a qualquer usuário criar uma nova campanha
        string calldata title,
        string calldata description,
        string calldata videoUrl,
        string calldata imageUrl
    ) public {
        campaigns[nextId] = Campaign({ // cria e salva o Campaign com ID nextId
            author: msg.sender,
            title: title,
            description: description,
            videoUrl: videoUrl,
            imageUrl: imageUrl,
            balance: 0,
            active: true,
            supporterCount: 0
        });

        campaignIds.push(nextId); // adiciona o ID ao vetor campaignIds para rastrear a ordem
        emit CampaignCreated(nextId, msg.sender); // emite o evento de camapnha criada
        nextId++;
    }

    function donate(uint256 id) public payable {
        require(msg.value > 0, "You must send a donation value > 0."); // usuário envia valor para a campanha
        require(campaigns[id].active, "Cannot donate to this campaign.");

        campaigns[id].balance += msg.value; // incrementa o saldo da campanha

        if (!hasDonated[id][msg.sender]) { // verifica se é a primeira vez que o usuário doa para aquela campanha, e atualiza o contador de apoiadores
            hasDonated[id][msg.sender] = true;
            campaigns[id].supporterCount += 1;
        }

        emit DonationReceived(id, msg.sender, msg.value); // emite o evento de doação recebida
    }

    function withdraw(uint256 id) public { // 
        Campaign storage campaign = campaigns[id];
        require(campaign.author == msg.sender, "You do not have permission."); // somente o autor da campanha pode sacar
        require(campaign.active, "This campaign is closed."); // aviso para saber se a campanha está ativa ou não 
        require(campaign.balance > fee, "Not enough balance."); // aviso para saber se o balanço da campanha está maior que a taxa ou não

        uint256 amount = campaign.balance - fee; // a campanha precisa estar ativa e ter saldo maior que a taxa
        campaign.active = false; // marca a campanha como inativa
        campaign.balance = 0; // zera o saldo

        (bool sent, ) = payable(campaign.author).call{value: amount}("");
        require(sent, "Failed to send funds."); // emite o valor para o autor(menos a taxa)

        emit Withdrawal(id, msg.sender, amount);
    }

    function editCampaign( // permite que o autor edite os dados da campanha enquanto ela está ativa
        uint256 id,
        string calldata newTitle,
        string calldata newDescription,
        string calldata newVideoUrl,
        string calldata newImageUrl
    ) public {
        Campaign storage campaign = campaigns[id];
        require(msg.sender == campaign.author, "Only author can edit.");
        require(campaign.active, "Cannot edit inactive campaign.");

        campaign.title = newTitle;
        campaign.description = newDescription;
        campaign.videoUrl = newVideoUrl;
        campaign.imageUrl = newImageUrl;
    }

    function getLastFiveCampaigns() public view returns (Campaign[] memory) { // cria um array temporário de até 5 campanhas
        uint256 count = campaignIds.length >= 5 ? 5 : campaignIds.length;
        Campaign[] memory recentCampaigns = new Campaign[](count);
        for (uint256 i = 0; i < count; i++) {
            uint256 idx = campaignIds.length - 1 - i;
            recentCampaigns[i] = campaigns[campaignIds[idx]];
        }
        return recentCampaigns; // retorna da mais nova para a mais antiga, baseado em campaignIds
    }

    function adminWithdraw() public onlyOwner { // admin pode sacar a taxa acumulada da plataforma
        require(address(this).balance >= fee, "Insufficient platform balance.");
        (bool sent, ) = payable(owner).call{value: fee}(""); // a função transfere fee para o owner
        require(sent, "Admin withdrawal failed.");
    }

    event CampaignCreated(uint256 id, address author);
    event DonationReceived(uint256 id, address from, uint256 amount);
    event Withdrawal(uint256 id, address to, uint256 amount);
    // permitem monitorar ações importantes fora da blockchain (via front-end ou backend)
}




