# 🪙⛓️ Donate Crypto - Plataforma de Doações via Web3

Um dApp (aplicativo descentralizado) simples, construído com React e Web3.js, que permite a criação e doação para campanhas diretamente na blockchain. Ideal para iniciativas sociais como ajuda a ONGs, resgates de animais, apoio a causas pessoais, entre outros.

---

## 🚀 Funcionalidades

- ✅ Login com MetaMask
- 📝 Cadastro de campanhas com título, descrição, vídeo e imagem
- 💸 Doação em criptomoeda (POL) diretamente para campanhas
- 🎥 Visualização da campanha com player de vídeo
- 🔒 Integração com contrato inteligente na rede blockchain

---

## 🛠️ Tecnologias Utilizadas

- [React](https://reactjs.org/)
- [TypeScript](https://www.typescriptlang.org/)
- [Web3.js](https://web3js.readthedocs.io/)
- [MetaMask](https://metamask.io/) (extensão)
- Solidity (para o contrato inteligente)

---

## 🧪 Pré-requisitos

Antes de iniciar, você precisa ter:

- [Node.js](https://nodejs.org/en/) instalado
- [MetaMask](https://metamask.io/) instalada no navegador
- Alguma rede de testes (ex: Polygon Mumbai Testnet) ou local (eu utilizei o https://amoy.polygonscan.com/)
- Faucet (criptomoeda de teste) para simular doações

💧 Para adquirir criptomoedas de teste (faucets), você pode usar:

- [https://faucet.luiztools.com.br/](https://faucet.luiztools.com.br/#)

Há também outros sites de faucet disponíveis para cada rede de teste. Certifique-se de selecionar a mesma rede configurada no seu MetaMask.

---

## ⚙️ Como rodar o projeto

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/seu-repo.git
cd seu-repo

# Instale as dependências
npm install

# Rode a aplicação
npm run dev
```

---

## 🔗 Contrato Inteligente

O contrato inteligente utilizado neste projeto foi desenvolvido em [Solidity](https://soliditylang.org/) e está localizado na pasta `smart-contract/` do repositório, no arquivo `DonateCrypto.sol`.

### Como Utilizar

1.  Acesse o [Remix IDE](https://remix.ethereum.org/).
2.  Crie uma nova pasta chamada `contracts` e carregue o arquivo `DonateCrypto.sol` para ela.
3.  Na aba **Solidity Compiler**, ative a opção **Enable Optimization** e compile o contrato.
4.  Na aba **Deploy & Run Transactions**, selecione o ambiente **Injected Provider - MetaMask** (ou outro de sua preferência).
5.  Realize o **deploy** do contrato e copie o endereço gerado.
6.  Atualize a constante `CONTRACT_ADDRESS` no arquivo `Web3Service.js` com o novo endereço do contrato:

    ```javascript
    const CONTRACT_ADDRESS = "cole_aqui_o_endereco_do_seu_contrato";
    ```

### Funções Principais

* `addCampaign(title, description, videoUrl, imageUrl)`: Adiciona uma nova campanha ao contrato.
* `donate(campaignId)`: Permite realizar uma doação para uma campanha específica.
* `getCampaign(id)`: Retorna os detalhes de uma campanha com base no seu ID.
* `nextId()`: Retorna o próximo ID disponível para uma nova campanha.

---

## 💡 Melhorias Futuras

* ️🖼️ Pré-visualização da imagem da campanha antes do cadastro.
* 🔔 Mensagens de erro e sucesso para feedback das ações do usuário.
* 📊 Exibição do total de doações por campanha.
* 📱 Melhorias na responsividade para dispositivos móveis.

---
```

