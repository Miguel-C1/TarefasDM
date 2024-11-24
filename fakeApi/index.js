const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors'); 
const clientes = require('./data/clientes.json');
const produtos = require('./data/produtos.json');

const app = express();

app.use(cors()); 

app.use(bodyParser.json());

app.get('/clientes', (req, res) => {
  res.json(clientes);
});

app.get('/produtos', (req, res) => {
  res.json(produtos);
});

app.post('/finalizar-pedido', (req, res) => {
  console.log('Pedido Recebido:', req.body);
  res.status(200).json({ message: 'Pedido finalizado com sucesso' });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Fake API rodando em http://localhost:${PORT}`);
});
