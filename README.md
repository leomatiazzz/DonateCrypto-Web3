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

O contrato inteligente usado neste projeto foi desenvolvido com [Solidity](https://soliditylang.org/) e está incluído na pasta `contracts/` do repositório (arquivo: `DonateCrypto.sol`).

### Como utilizar

1. Acesse o [Remix IDE](https://remix.ethereum.org/).
2. Crie uma nova pasta chamada `contracts` e envie o arquivo `DonateCrypto.sol` para ela.
3. Vá até a aba **Solidity Compiler**, ative a opção **Enable Optimization** e compile o contrato.
4. Em seguida, na aba **Deploy & Run Transactions**, selecione o ambiente **Injected Provider - MetaMask** (ou outro de sua preferência).
5. Faça o **deploy** do contrato e copie o endereço gerado.
6. Por fim, atualize a constante `CONTRACT_ADDRESS` no arquivo `Web3Service.js` com esse novo endereço:

```js
const CONTRACT_ADDRESS = "cole_aqui_o_endereco_do_seu_contrato";

- **Funções principais:**
  - `addCampaign(title, description, videoUrl, imageUrl)`
  - `donate(campaignId)`
  - `getCampaign(id)`
  - `nextId()`

---

## 📂 Estrutura de pastas

```

src/
├── app/ # Páginas principais do app
├── services/ # Web3Service para lidar com blockchain
└── ABI.json # Interface do contrato inteligente

```

---

## 💡 Melhorias futuras

- 🖼️ Preview da imagem da campanha antes de cadastrar
- 🔔 Mensagens de erro e sucesso nas ações
- 📊 Total de doações por campanha
- 📱 Melhor responsividade mobile

---
```

