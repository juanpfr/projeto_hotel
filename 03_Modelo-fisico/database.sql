CREATE DATABASE projeto_hotel;

USE projeto_hotel;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    CPF VARCHAR(14) UNIQUE NOT NULL,
    status ENUM('ATIVO', 'DESATIVADO') NOT NULL,
    endereco TEXT
);

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_reserva DATETIME NOT NULL,
    status ENUM('PENDENTE', 'CONFIRMADA', 'CANCELADA') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE periodo (
    id_periodo INT AUTO_INCREMENT PRIMARY KEY,
    data_checkin DATE NOT NULL,
    data_checkout DATE NOT NULL
);

CREATE TABLE quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero_quarto INT UNIQUE NOT NULL,
    tipo ENUM('ÚNICO', 'DUPLO', 'SUÍTE') NOT NULL,
    capacidade INT NOT NULL,
    preco_diaria DECIMAL(10,2) NOT NULL,
    status ENUM('DISPONÍVEL', 'OCUPADO', 'MANUTENÇÃO') NOT NULL
);

CREATE TABLE reserva_periodo (
    id_reserva INT,
    id_periodo INT,
    id_quarto INT,
    PRIMARY KEY (id_reserva, id_periodo, id_quarto),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva),
    FOREIGN KEY (id_periodo) REFERENCES periodo(id_periodo),
    FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto)
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    data_pagamento DATETIME NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    forma_pagamento ENUM('CARTÃO', 'BOLETO', 'PIX', 'DINHEIRO') NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
);

CREATE TABLE servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    prioridade ENUM('BAIXA', 'MÉDIA', 'ALTA') NOT NULL,
    valor DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE reserva_servico (
    id_reserva INT,
    id_servico INT,
    PRIMARY KEY (id_reserva, id_servico),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);

CREATE TABLE hospede (
    id_hospede INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    documento VARCHAR(20) UNIQUE NOT NULL,
    id_reserva INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);