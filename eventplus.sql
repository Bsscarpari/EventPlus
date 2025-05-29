CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(100),
    endereco VARCHAR(100)
);

CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(100),
    nome VARCHAR(100),
    contato VARCHAR(100),
    servico VARCHAR(100)
);

CREATE TABLE Local (
    id_local INT AUTO_INCREMENT PRIMARY KEY,
    endereco VARCHAR(100)
);

CREATE TABLE Agenda (
    id_agenda INT AUTO_INCREMENT PRIMARY KEY,
    data DATE
);

CREATE TABLE TipoEvento (
    id_tipoevento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE ItemEvento (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    tipo VARCHAR(100),
    quantidade INT
);

CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pagamento VARCHAR(100)
);

CREATE TABLE Evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data DATE,
    local INT,
    orcamento DECIMAL(10,2),
    FOREIGN KEY (local) REFERENCES Local(id_local)
);

-- Relacionamentos

CREATE TABLE Realiza (
    id_evento INT,
    id_cliente INT,
    PRIMARY KEY (id_evento, id_cliente),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE TrabalhaEm (
    id_evento INT,
    id_funcionario INT,
    PRIMARY KEY (id_evento, id_funcionario),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

CREATE TABLE Contrata (
    id_evento INT,
    id_fornecedor INT,
    PRIMARY KEY (id_evento, id_fornecedor),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE OcorreEm (
    id_evento INT,
    id_local INT,
    PRIMARY KEY (id_evento, id_local),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_local) REFERENCES Local(id_local)
);

CREATE TABLE Disponibilidade (
    id_agenda INT,
    id_local INT,
    PRIMARY KEY (id_agenda, id_local),
    FOREIGN KEY (id_agenda) REFERENCES Agenda(id_agenda),
    FOREIGN KEY (id_local) REFERENCES Local(id_local)
);

CREATE TABLE ClassificadoComo (
    id_evento INT,
    id_tipoevento INT,
    PRIMARY KEY (id_evento, id_tipoevento),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_tipoevento) REFERENCES TipoEvento(id_tipoevento)
);

CREATE TABLE PossuiItem (
    id_evento INT,
    id_item INT,
    PRIMARY KEY (id_evento, id_item),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_item) REFERENCES ItemEvento(id_item)
);

CREATE TABLE RelacionadoPagamento (
    id_evento INT,
    id_pagamento INT,
    PRIMARY KEY (id_evento, id_pagamento),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    FOREIGN KEY (id_pagamento) REFERENCES Pagamento(id_pagamento)
);
