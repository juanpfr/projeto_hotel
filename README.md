# **Projeto de Hotel - Atividade de SQL para Aprendizado**

---

## **Descrição do Projeto**

Este projeto é uma atividade prática desenvolvida para fins educacionais, com o objetivo de explorar e aplicar conceitos fundamentais de SQL (Structured Query Language) em um cenário realista. O contexto escolhido é o gerenciamento de um hotel, onde diferentes tabelas representam entidades e relacionamentos típicos de um sistema de reservas e hospedagem.

O projeto abrange a criação de um banco de dados relacional que simula as operações de um hotel, como cadastro de clientes, reservas, quartos, serviços, pagamentos e hóspedes. Além disso, ele explora conceitos como chaves primárias, chaves estrangeiras, tipos de dados, enumerações, restrições de integridade e consultas SQL.

---

## **Tabelas do Projeto**

A seguir, estão descritas as tabelas criadas no projeto, suas colunas e seus propósitos:

### 1. **`cliente`**
- **Descrição**: Armazena informações sobre os clientes do hotel.
- **Colunas**:
  - `id_cliente`: Identificador único do cliente (chave primária).
  - `nome`: Nome completo do cliente.
  - `email`: Endereço de e-mail do cliente.
  - `telefone`: Número de telefone do cliente.
  - `CPF`: Documento de identificação do cliente (formato XXX.XXX.XXX-XX).
  - `status`: Status do cliente (`ATIVO` ou `DESATIVADO`).
  - `endereco`: Endereço completo do cliente.

---

### 2. **`reserva`**
- **Descrição**: Registra as reservas feitas pelos clientes.
- **Colunas**:
  - `id_reserva`: Identificador único da reserva (chave primária).
  - `id_cliente`: Identificador do cliente que fez a reserva (chave estrangeira referenciando `cliente`).
  - `data_reserva`: Data e hora em que a reserva foi feita.
  - `status`: Status da reserva (`PENDENTE`, `CONFIRMADA`, `CANCELADA`).
  - `valor_total`: Valor total da reserva.

---

### 3. **`periodo`**
- **Descrição**: Define os períodos de check-in e check-out associados às reservas.
- **Colunas**:
  - `id_periodo`: Identificador único do período (chave primária).
  - `data_checkin`: Data de entrada no hotel.
  - `data_checkout`: Data de saída do hotel.

---

### 4. **`quarto`**
- **Descrição**: Armazena informações sobre os quartos disponíveis no hotel.
- **Colunas**:
  - `id_quarto`: Identificador único do quarto (chave primária).
  - `numero_quarto`: Número do quarto (único).
  - `tipo`: Tipo de quarto (`ÚNICO`, `DUPLO`, `SUÍTE`).
  - `capacidade`: Capacidade máxima de ocupantes do quarto.
  - `preco_diaria`: Preço cobrado por diária no quarto.
  - `status`: Status do quarto (`DISPONÍVEL`, `OCUPADO`, `MANUTENÇÃO`).

---

### 5. **`reserva_periodo`**
- **Descrição**: Relaciona reservas, períodos e quartos.
- **Colunas**:
  - `id_reserva`: Identificador da reserva (chave estrangeira referenciando `reserva`).
  - `id_periodo`: Identificador do período (chave estrangeira referenciando `periodo`).
  - `id_quarto`: Identificador do quarto (chave estrangeira referenciando `quarto`).
  - **Chave Primária**: Combinação de `id_reserva`, `id_periodo` e `id_quarto`.

---

### 6. **`pagamento`**
- **Descrição**: Registra os pagamentos realizados para as reservas.
- **Colunas**:
  - `id_pagamento`: Identificador único do pagamento (chave primária).
  - `id_reserva`: Identificador da reserva associada ao pagamento (chave estrangeira referenciando `reserva`).
  - `data_pagamento`: Data e hora do pagamento.
  - `valor_pago`: Valor pago pelo cliente.
  - `forma_pagamento`: Forma de pagamento utilizada (`CARTÃO`, `BOLETO`, `PIX`, `DINHEIRO`).

---

### 7. **`servico`**
- **Descrição**: Lista os serviços oferecidos pelo hotel.
- **Colunas**:
  - `id_servico`: Identificador único do serviço (chave primária).
  - `descricao`: Descrição do serviço.
  - `prioridade`: Prioridade do serviço (`BAIXA`, `MÉDIA`, `ALTA`).
  - `valor`: Custo do serviço (padrão: `0.00`).

---

### 8. **`reserva_servico`**
- **Descrição**: Relaciona reservas com os serviços solicitados.
- **Colunas**:
  - `id_reserva`: Identificador da reserva (chave estrangeira referenciando `reserva`).
  - `id_servico`: Identificador do serviço (chave estrangeira referenciando `servico`).
  - **Chave Primária**: Combinação de `id_reserva` e `id_servico`.

---

### 9. **`hospede`**
- **Descrição**: Armazena informações sobre os hóspedes que ocupam os quartos.
- **Colunas**:
  - `id_hospede`: Identificador único do hóspede (chave primária).
  - `nome`: Nome completo do hóspede.
  - `documento`: Documento de identificação do hóspede (formato único).
  - `id_reserva`: Identificador da reserva associada ao hóspede (chave estrangeira referenciando `reserva`).
  - `id_cliente`: Identificador do cliente associado ao hóspede (chave estrangeira referenciando `cliente`).

---

## **Objetivo Educacional**

Este projeto foi desenvolvido para ajudar estudantes e entusiastas de SQL a praticar os seguintes conceitos:

1. **Modelagem de Dados**:
   - Entender como modelar um banco de dados relacional com base em um cenário real.
   - Criar tabelas e definir relacionamentos entre elas usando chaves primárias e estrangeiras.

2. **Manipulação de Dados**:
   - Inserir, atualizar e excluir registros em tabelas.
   - Garantir a consistência dos dados com restrições de integridade.

3. **Consultas SQL**:
   - Escrever consultas simples e complexas para recuperar informações das tabelas.
   - Explorar junções (`JOIN`) para combinar dados de múltiplas tabelas.

4. **Tipos de Dados e Enumerações**:
   - Utilizar tipos de dados apropriados para cada coluna.
   - Trabalhar com enumerações para limitar valores possíveis em determinadas colunas.

5. **Normalização**:
   - Aplicar princípios de normalização para evitar redundâncias e inconsistências.

---

## **Como Usar Este Projeto**

1. **Configuração do Ambiente**:
   - Certifique-se de ter instalado um sistema de gerenciamento de banco de dados (SGBD) compatível com SQL, como MySQL, PostgreSQL ou MariaDB.
   - Execute os scripts SQL fornecidos para criar as tabelas e inserir os dados iniciais.

2. **Exploração**:
   - Experimente escrever consultas SQL para explorar os dados inseridos.
   - Pratique a criação de novas tabelas, inserção de registros e execução de operações CRUD (Create, Read, Update, Delete).

3. **Expansão**:
   - Adicione novas funcionalidades ao projeto, como tabelas adicionais ou consultas mais complexas.
   - Implemente triggers, views ou stored procedures para enriquecer o sistema.

---

## **Conclusão**

Este projeto é uma excelente oportunidade para aprender e praticar SQL em um contexto prático e envolvente. Ao trabalhar com as tabelas e dados fornecidos, você poderá desenvolver habilidades essenciais para lidar com bancos de dados relacionais em projetos reais. Divirta-se explorando e expandindo este sistema! 😊
