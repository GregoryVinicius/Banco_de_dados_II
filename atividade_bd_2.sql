DROP DATABASE IF EXISTS servico;
CREATE DATABASE servico;
USE servico;

CREATE TABLE clientes(
id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,whatsapp VARCHAR(255) NOT NULL
);

CREATE TABLE servicos(
id_servico INT PRIMARY KEY NOT NULL AUTO_INCREMENT
,nome_servico VARCHAR(255) NOT NULL
,valor_servico DECIMAL NOT NULL
);

CREATE TABLE servico_por_cliente(
id_servico_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,id_cliente INT NOT NULL
,id_servico INT NOT NULL
,CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
,CONSTRAINT fk_servico FOREIGN KEY (id_servico) REFERENCES servicos (id_servico)
);

INSERT INTO clientes(nome, whatsapp) VALUES ('Gregory', '55(84)93864-1356');
INSERT INTO clientes(nome, whatsapp) VALUES ('Leonardo', '55(85)93254-8680');
INSERT INTO clientes(nome, whatsapp) VALUES ('Caue', '55(21)93288-5336');
INSERT INTO clientes(nome, whatsapp) VALUES ('Renato', '55(86)92487-8340');
INSERT INTO clientes(nome, whatsapp) VALUES ('Vitor', '(63)92158-9575');

INSERT INTO servicos(nome_servico, valor_servico) VALUES ('contar grao de areia na praia', 2);
INSERT INTO servicos(nome_servico, valor_servico) VALUES ('sentar em uma cadeira', 4);
INSERT INTO servicos(nome_servico, valor_servico) VALUES ('comer bolo', 1);
INSERT INTO servicos(nome_servico, valor_servico) VALUES ('lavar o pe do sapo que nao lava o pe', 12);
INSERT INTO servicos(nome_servico, valor_servico) VALUES ('virar uma estrelinha', 5);

SELECT
nome
,nome_servico
,valor_servico
FROM clientes, servicos, servico_por_cliente
WHERE clientes.id_cliente = servico_por_cliente.id_servico_cliente AND servico_por_cliente.id_servico_cliente = servicos.id_servico;

ALTER TABLE clientes ADD COLUMN cpf VARCHAR (14) NOT NULL;

ALTER TABLE servico_por_cliente ADD COLUMN data_servico DATE NOT NULL;

ALTER TABLE servicos MODIFY COLUMN valor_servico DECIMAL NOT NULL DEFAULT 0.00;

ALTER TABLE clientes MODIFY COLUMN whatsapp VARCHAR(16);

/*
8.Onde os comandos DDL foram utilizados? E os DML?

R - os comandos DDL foram utilizados para criar o banco de dados e as tabelas e alterar as tabelas, também poderia ser utilizado para derrubar, mas não foi necessário. Já os DML foram utilizados para adicionar colunas e modificar colunas nas tabelas, também poderia deletar informações mas não foi necessário.
*/