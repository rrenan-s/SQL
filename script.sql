DROP DATABASE IF EXISTS DBDELEGACIA;

CREATE DATABASE DBDELEGACIA;

USE DBDELEGACIA;

CREATE TABLE CRIME (
	IDCRIME INT NOT NULL,
	DESCRICAO VARCHAR(255),
	RUA VARCHAR(100),
	NUMERO INT,
	COMPLEMENTO VARCHAR(255),
	BAIRRO VARCHAR(100),
	CEP VARCHAR(8),
	CIDADE VARCHAR(100),
	ESTADO CHAR(2)
);

alter table crime drop idcrime,
add idcrime int not null auto_increment,
add primary key (idcrime),
add dtcrime date;

CREATE TABLE CRIMINOSO(
  RUA VARCHAR(100),
  NUMERO INT,
  COMPLEMENTO VARCHAR(255),
  BAIRRO VARCHAR(100),
  CEP CHAR(8),
  CIDADE VARCHAR(100),
  ESTADO CHAR(2),
  DTNASCIMENTO DATE,
  TELEFONE VARCHAR(15)
);

alter table criminoso add idcriminoso int not null auto_increment, 
add primary key (idcriminoso);

CREATE TABLE OCORRENCIA (
	IDOCORRENCIA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	DT_OCORRENCIA DATE
);

CREATE TABLE ITEM_OCORRENCIA (
	IDITEM INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IDOCORRENCIA INT NOT NULL,
	DESCRICAO VARCHAR (100),
	CONSTRAINT FK_ITEM_OCORRENCIA_OCORRENCIA FOREIGN KEY (IDOCORRENCIA)
    REFERENCES OCORRENCIA(IDOCORRENCIA)
);

drop table item_ocorrencia;
drop table ocorrencia;

CREATE TABLE VITIMA (
  RUA VARCHAR(100),
  NUMERO INT,
  COMPLEMENTO VARCHAR(255),
  BAIRRO VARCHAR(100),
  CEP VARCHAR(8),
  CIDADE VARCHAR(100),
  ESTADO CHAR(2),
  DTNASCIMENTO DATE
);

alter table vitima add idvitima int not null auto_increment,
add primary key (idvitima);

CREATE TABLE COMETE(
	IDCRIME INT NOT NULL,
	IDCRIMINOSO INT NOT NULL
);

alter table comete add primary key(idcrime, idcriminoso);

CREATE TABLE ATACA (
	OBSERVACAO CHAR(1)
);

alter table ataca drop observacao,
add idvitima int not null, 
add idcriminoso int not null,
add primary key (idvitima, idcriminoso);

CREATE TABLE SOFRE (
	IDCRIME INT NOT NULL,
	IDVITIMA INT NOT NULL
);

alter table sofre add primary key (idcrime, idvitima);

CREATE TABLE ARMA (
	IDARMA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(110)
);

alter table arma drop idarma,
drop marca,
add idarma int not null,
add descricao varchar(45),
add identificacao varchar(15),
add tipo enum('arma branca', 'arma de fogo');

CREATE TABLE USADA (
	IDARMA INT NOT NULL,
	IDCRIME INT NOT NULL
);

alter table usada add primary key (idarma, idcrime);