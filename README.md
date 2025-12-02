# Arquitetura de Microsserviços

## Como rodar

Subir os serviços:
   ```bash
   docker-compose up -d
   ```

## Testar API

Existem dois arquivos para testar a API:

### 1. Testes Manuais (`curls.sh`)
Rodar um curl por vez, alterando os *ID*.

**Executar:**
```bash
./curls.sh
```

## API Gateway (Kong)

O Kong está configurado como API Gateway na porta `8000`. O Konga é a interface de administração do Kong, acessível em `http://localhost:1337`.
- Os serviços, rotas e plugins já são configurados ao subir o *docker*

### Exemplo: Configurar Serviço e Rota para Usuários

1. **Criar Serviço:**
```bash
curl -i -X POST http://localhost:8001/services \
  --data name=user-service \
  --data url='http://cliente-service:3001'
```

2. **Criar Rota:**
```bash
curl -i -X POST http://localhost:8001/services/user-service/routes \
  --data 'paths[]=/users' \
  --data name=user-route
```

3. **Testar via Kong:**
```bash
curl http://localhost:8000/users
```

## Limpar tudo

```bash
docker-compose down -v
```
