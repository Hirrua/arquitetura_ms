#!/bin/bash

# Criar usuário
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Teste User",
    "email": "teste@email.com"
  }' \
  http://localhost:8000/users

# Criar produto 1
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Notebook",
    "description": "Notebook Dell",
    "price": 3500.00,
    "stock": 10
  }' \
  http://localhost:8000/products

# Criar produto 2
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Mouse",
    "description": "Mouse Logitech",
    "price": 150.00,
    "stock": 50
  }' \
  http://localhost:8000/products

# Criar produto 3
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Teclado",
    "description": "Teclado Mecânico",
    "price": 650.00,
    "stock": 30
  }' \
  http://localhost:8000/products

# Criar tipo de pagamento 1
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Cartão de Crédito"
  }' \
  http://localhost:8000/type-payments

# Criar tipo de pagamento 2
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "name": "PIX"
  }' \
  http://localhost:8000/type-payments

# Criar tipo de pagamento 3
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Boleto Bancário"
  }' \
  http://localhost:8000/type-payments

# Listar produtos
curl -X GET http://localhost:8000/products

# Listar usuários
curl -X GET http://localhost:8000/users

# Buscar usuário por ID
curl -X GET http://localhost:8000/users/e26022db-e826-4b56-a46b-c1958c26e966

# Listar tipos de pagamento
curl -X GET http://localhost:8000/type-payments

# Buscar produto por ID
curl -X GET http://localhost:8000/products/ec40399b-d90b-4c33-953f-52666b0ad341

# Criar pedido
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "e26022db-e826-4b56-a46b-c1958c26e966",
    "products": [
      {
        "productId": "ec40399b-d90b-4c33-953f-52666b0ad341",
        "quantity": 2
      }
    ],
    "paymentMethods": [
      {
        "typeId": "23568b40-add6-4e16-bfc9-a09b3bcaa7a3"
      }
    ]
  }' \
  http://localhost:8000/orders

# Listar pedidos
curl -X GET http://localhost:8000/orders

# Buscar pedido por ID
curl -X GET http://localhost:8000/orders/692ce80d17ece268668a02be

# Buscar pagamentos por pedido
curl -X GET http://localhost:8000/payments/order/692ce80d17ece268668a02be

# Processar pagamento
curl -X PATCH \
  -H "Content-Type: application/json" \
  -d '{
    "value": 7000.00
  }' \
  http://localhost:8000/payments/f95d7bae-e55e-446b-8104-cf986ce4959d/process

# Atualizar usuário
curl -X PATCH \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Teste User Atualizado",
    "email": "teste.atualizado@email.com"
  }' \
  http://localhost:8000/users/e26022db-e826-4b56-a46b-c1958c26e966

# Atualizar produto
curl -X PATCH \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Notebook Dell XPS",
    "description": "Notebook Dell XPS 15",
    "price": 4500.00
  }' \
  http://localhost:8000/products/ec40399b-d90b-4c33-953f-52666b0ad341

# Atualizar estoque do produto
curl -X PATCH \
  -H "Content-Type: application/json" \
  -d '{
    "quantity": 5
  }' \
  http://localhost:8000/products/ec40399b-d90b-4c33-953f-52666b0ad341/stock

# Atualizar status do pedido - PAGO
curl -X PATCH \
  -H "Content-Type: application/json" \
  -d '{
    "status": "PAGO"
  }' \
  http://localhost:8000/orders/692ce80d17ece268668a02be/status

# Atualizar status do pedido - CANCELADO
curl -X PATCH \
  -H "Content-Type: application/json" \
  -d '{
    "status": "CANCELADO"
  }' \
  http://localhost:8000/orders/692ce80d17ece268668a02be/status

# Deletar produto
curl -X DELETE http://localhost:8000/products/ec40399b-d90b-4c33-953f-52666b0ad341

# Deletar usuário
curl -X DELETE http://localhost:8000/users/e26022db-e826-4b56-a46b-c1958c26e966
