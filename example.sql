-- Entidades
CREATE TABLE cliente(
    id INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL,
    cpf VARCHAR(12) NOT NULL,
    credito INTEGER DEFAULT 0,
    dtCadastro TIMESTAMP DEFAULT now(),
    PRIMARY KEY(id)
);

CREATE TABLE funcionario(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idCliente INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (idCliente) REFERENCES cliente(id) ON DELETE CASCADE
);

CREATE TABLE brinquedo(
    id INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE brinquedo_pontuacao(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idBrinquedo INTEGER,
    ordem INTEGER NOT NULL,
  	pontuacao INTEGER NOT NULL,
    credito INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (idBrinquedo) REFERENCES brinquedo(id) ON DELETE CASCADE
);

CREATE TABLE tipo_credito(
    id INTEGER NOT NULL AUTO_INCREMENT,
    credito VARCHAR(15) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE historico_credito(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idFuncionario INTEGER,
    idCliente INTEGER,
    idTipoCredito INTEGER,
    credito INTEGER NOT NULL,
    data TIMESTAMP DEFAULT now(),
    PRIMARY KEY(id),
    FOREIGN KEY (idFuncionario) REFERENCES funcionario(id) ON DELETE CASCADE,
    FOREIGN KEY (idCliente) REFERENCES cliente(id) ON DELETE CASCADE,
    FOREIGN KEY (idTipoCredito) REFERENCES tipo_credito(id) ON DELETE CASCADE
);

-- Dados para a tabela cliente
INSERT INTO cliente (nome, email, cpf, credito, dtCadastro) VALUES
('João Silva', 'joao.silva@example.com', '12345678901', 100, '2025-01-01 10:00:00'),
('Maria Oliveira', 'maria.oliveira@example.com', '98765432101', 200, '2025-01-01 11:00:00'),
('Carlos Pereira', 'carlos.pereira@example.com', '45678912301', 150, '2025-01-01 12:00:00');

-- Dados para a tabela funcionario
INSERT INTO funcionario (idCliente) VALUES
(1),
(2);

-- Dados para a tabela brinquedo
INSERT INTO brinquedo (nome) VALUES
('Basquete'),
('Pescaria'),
('Mini boliche');

-- Dados para a tabela brinquedo_pontuacao
INSERT INTO brinquedo_pontuacao (idBrinquedo, ordem, pontuacao, credito) VALUES

(1, 1, 10, 200),
(1, 2, 20, 300),
(1, 3, 30, 400),

(2, 1, 5, 75),
(2, 2, 10, 75),
(2, 3, 15, 75),

(3, 1, 6, 70),
(3, 2, 5, 60),
(3, 3, 4, 50),
(3, 4, 3, 40),
(3, 5, 2, 30),
(3, 6, 1, 20);

-- Dados para a tabela tipo_credito
INSERT INTO tipo_credito (id, credito) VALUES
(1, "RECARGA"),
(2, "B1");

-- Dados para a tabela historico_credito
INSERT INTO historico_credito (id, idFuncionario, idCliente, idTipoCredito, credito, data) VALUES
(1, 1, 1, 1, 100, '2025-01-01 13:00:00'),
(2, 2, 2, 2, 200, '2025-01-01 14:00:00');


