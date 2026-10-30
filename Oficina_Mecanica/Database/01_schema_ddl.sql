CREATE DATABASE IF NOT EXISTS Oficina_mecanica;
USE Oficina_mecanica;


CREATE TABLE clientes (
    idClientes INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) UNIQUE,
    Email VARCHAR(100),
    Endereco VARCHAR(150)
);


CREATE TABLE veiculos (
    idVeiculos INT AUTO_INCREMENT PRIMARY KEY,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Ano INT,
    Placa VARCHAR(10) UNIQUE,
    idClientes INT NOT NULL,
    FOREIGN KEY (idClientes) REFERENCES clientes(idClientes)
);


CREATE TABLE mecanicos (
    idMecanicos INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(100),
    Telefone VARCHAR(20) UNIQUE
);


CREATE TABLE servicos (
    idServicos INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(200),
    Valor DECIMAL(10,2) NOT NULL
);


CREATE TABLE pecas (
    idPecas INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(200),
    Preco DECIMAL(10,2) NOT NULL,
    Quantidade_estoque INT NOT NULL
);


CREATE TABLE ordens_servico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    Data_abertura DATETIME NOT NULL,
    Data_conclusao DATETIME NULL,
    Status VARCHAR(30) NOT NULL,
    idVeiculos INT NOT NULL,
    idMecanicos INT NOT NULL,
    idServicos INT NOT NULL,
    FOREIGN KEY (idVeiculos) REFERENCES veiculos(idVeiculos),
    FOREIGN KEY (idMecanicos) REFERENCES mecanicos(idMecanicos),
    FOREIGN KEY (idServicos) REFERENCES servicos(idServicos)
);


CREATE TABLE itens_os (
    idItem INT AUTO_INCREMENT PRIMARY KEY,
    Quantidade INT NOT NULL,
    Valor_Unitario DECIMAL(10,2) NOT NULL,
    Ordens_servico_id_os INT NOT NULL,
    idPecas INT NOT NULL,
    FOREIGN KEY (Ordens_servico_id_os)
        REFERENCES ordens_servico(id_os),
    FOREIGN KEY (idPecas)
        REFERENCES pecas(idPecas)
);