CREATE TABLE cliente
(
    "codCliente" serial,
    nome character varying(50),
    cnpj character varying(50),
    CONSTRAINT "codCliente" PRIMARY KEY ("codCliente"),
    CONSTRAINT "unique_cliente" UNIQUE ("codCliente")
);

CREATE TABLE endereco
(
    "codCliente" serial NOT NULL,
    "codEndereco" serial NOT NULL,
    logradouro character varying(200) NOT NULL,
    bairro character varying(50) NOT NULL,
    cidade character varying(50) NOT NULL,
    uf character varying(2) NOT NULL,
    CONSTRAINT primary_key_endereco PRIMARY KEY ("codCliente", "codEndereco"),
    CONSTRAINT "unique_endereco" UNIQUE ("codEndereco"),
    CONSTRAINT "codCliente" FOREIGN KEY ("codCliente")
        REFERENCES cliente ("codCliente") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
   

CREATE TABLE venda
(
    "codVenda" serial NOT NULL,
    "codCliente" serial NOT NULL,
    data_venda timestamp without time zone,
    valor_total float NOT NULL,
    CONSTRAINT primary_key_venda PRIMARY KEY ("codVenda", "codCliente"),
    CONSTRAINT "unique_venda" UNIQUE ("codVenda"),
    CONSTRAINT codigo_cliente_venda_id_fkey FOREIGN KEY ("codCliente")
        REFERENCES cliente ("codCliente") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE RESTRICT
);



CREATE TABLE notaFiscal
(
    "codNotaFiscal" serial NOT NULL,
    "codVenda" serial NOT NULL,
    numero integer NOT NULL,
    CONSTRAINT primar_key PRIMARY KEY ("codNotaFiscal", "codVenda"),
    CONSTRAINT unique_fk UNIQUE ("codVenda"),
    CONSTRAINT fk_id FOREIGN KEY ("codNotaFiscal")
        REFERENCES venda ("codVenda") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);



CREATE TABLE material (
    "codMaterial" SERIAL NOT NULL,
    nome varchar(50),
    descricao varchar(200),
    preco float,
	CONSTRAINT "primary_key_material" PRIMARY KEY ("codMaterial")  
);

CREATE TABLE item (
    "codItem" SERIAL NOT NULL,
	"codVenda" integer NOT NULL,
    "codMaterial" integer NOT NULL,
    quantidade integer NOT NULL,
    valorDesconto float NOT NULL,   
	CONSTRAINT "primary_key_item" PRIMARY KEY ("codItem", "codVenda", "codMaterial"),
    CONSTRAINT "unique_item" UNIQUE ("codItem"),
	CONSTRAINT "codigo_venda_item_id_fkey" FOREIGN KEY ("codVenda")
		REFERENCES venda ("codVenda") MATCH SIMPLE
		ON UPDATE CASCADE ON DELETE NO ACTION,
	CONSTRAINT "codigo_material_item_id_fkey" FOREIGN KEY ("codMaterial")
		REFERENCES material ("codMaterial") MATCH SIMPLE
		ON UPDATE CASCADE ON DELETE NO ACTION
);

-- Inserts script

-- Cliente

INSERT INTO cliente(
	  "codCliente", nome, cnpj)
	VALUES (1, 'Mayara', '10.438.456/0001-91');
	
INSERT INTO cliente(
	 "codCliente", nome, cnpj)
	VALUES (2, 'Lucas', '63.322.103/0001-98');

INSERT INTO cliente(
	 "codCliente",  nome, cnpj)
	VALUES (3, 'Igor', '73.701.884/0001-85');
	
INSERT INTO cliente(
	 "codCliente", nome, cnpj)
	VALUES (4, 'Brunna', '34.588.910/0001-59');


INSERT INTO cliente(
	 "codCliente",  nome, cnpj)
	VALUES (5, 'Jonathan', '90.292.115/0001-90');

INSERT INTO cliente(
	"codCliente", nome, cnpj)
	VALUES (6,'Geovanne', '641.520.963/0001-95');


-- Enderecos

INSERT INTO endereco(
	"codEndereco", "codCliente",  logradouro, bairro, cidade, uf)
	VALUES ('1','4', 'rua A', 'bairro A', 'A', 'A');
	
INSERT INTO endereco(
	"codEndereco", "codCliente",  logradouro, bairro, cidade, uf)
	VALUES ('2','4', 'rua B', 'bairro B', 'A', 'A');	
	
INSERT INTO endereco(
	"codEndereco", "codCliente",  logradouro, bairro, cidade, uf)
	VALUES ('3','2', 'rua C', 'bairro C', 'A', 'A');
	
INSERT INTO endereco(
	"codEndereco", "codCliente",  logradouro, bairro, cidade, uf)
	VALUES ('4',' 3', 'rua D', 'bairro D', 'D', 'D');
	
INSERT INTO endereco(
	"codEndereco", "codCliente",  logradouro, bairro, cidade, uf)
	VALUES ('5', '5', 'rua E', 'bairro E', 'E', 'E');
	
INSERT INTO endereco(
	"codEndereco", "codCliente",  logradouro, bairro, cidade, uf)
	VALUES ('6', '6', 'rua F', 'bairro F', 'F', 'F');
	
INSERT INTO endereco(
	"codEndereco", "codCliente",  logradouro, bairro, cidade, uf)
	VALUES ('7', '6', 'rua G', 'bairro G', 'G', 'G');
	
INSERT INTO endereco(
	"codEndereco", "codCliente",  logradouro, bairro, cidade, uf)
	VALUES ('8', '6', 'rua H', 'bairro H','G', 'G');

-- Material

INSERT INTO material(
	  "codMaterial", nome, descricao, preco)
	VALUES ('1','material 1', 'descrição do material 1', 10.6);
	
INSERT INTO material(
	 "codMaterial", nome, descricao, preco)
	VALUES ('2','material 2', 'descrição do material 2', 54.0);
	
INSERT INTO material(
	 "codMaterial", nome, descricao, preco)
	VALUES ('3','material 3', 'descrição do material 3', 16.12);
	
INSERT INTO material(
	 "codMaterial", nome, descricao, preco)
	VALUES ('4','material 4', 'descrição do material 4', 5.96);
	
INSERT INTO material(
	 "codMaterial", nome, descricao, preco)
	VALUES ('5','material 5', 'descrição do material 5', 9.52);
	
INSERT INTO material(
	 "codMaterial", nome, descricao, preco)
	VALUES ('6', 'material 6', 'descrição do material 6', 68.50);
	

-- Venda

INSERT INTO venda(
	"codVenda", "codCliente", data_venda, valor_total)
	VALUES ('1', '2', '2017-07-23 3:10:11', 569.32);
	
INSERT INTO venda(
	"codVenda", "codCliente", data_venda, valor_total)
	VALUES ('2','2', '2017-07-28 12:10:11', 420.90);
	
INSERT INTO venda(
	"codVenda", "codCliente", data_venda, valor_total)
	VALUES ('3', '3', '2017-07-28 13:53:11', 65.50);
	
INSERT INTO venda(
	"codVenda", "codCliente", data_venda, valor_total)
	VALUES ('4', '6', '2017-08-24 19:10:11',102.29);

INSERT INTO venda(
	"codVenda", "codCliente", data_venda, valor_total)
	VALUES ('5', '6', '2018-03-30 19:10:11',62.90);


-- Item de Vendas

INSERT INTO item(
	"codItem", "codVenda", "codMaterial", quantidade, valordesconto)
	VALUES (1, 2, 1, 4, 0.25);
	
INSERT INTO item(
	"codItem", "codVenda", "codMaterial", quantidade, valordesconto)
	VALUES (2, 2, 2, 2, 0.25);
	
INSERT INTO item(
	"codItem", "codVenda", "codMaterial", quantidade, valordesconto)
	VALUES (3, 2, 5, 10, 0.5);
	
INSERT INTO item(
	"codItem", "codVenda", "codMaterial", quantidade, valordesconto)
	VALUES (4, 4, 6, 10, 0.5);

INSERT INTO item(
	"codItem", "codVenda", "codMaterial", quantidade, valordesconto)
	VALUES (5, 3, 3, 5, 0.25);
	
INSERT INTO item(
	"codItem", "codVenda", "codMaterial", quantidade, valordesconto)
	VALUES (6, 3, 4, 3, 0.25);
	
INSERT INTO item(
	"codItem", "codVenda", "codMaterial", quantidade, valordesconto)
	VALUES (7, 3, 2, 1, 0);
	
INSERT INTO item(
	"codItem", "codVenda", "codMaterial", quantidade, valordesconto)
	VALUES (8, 3, 6, 5, 0);
	
INSERT INTO item(
	"codItem", "codVenda", "codMaterial", quantidade, valordesconto)
	VALUES (9, 5, 6, 10, 0);


-- Nota Fiscal

INSERT INTO notafiscal(
	"codNotaFiscal", "codVenda", numero)
	VALUES (1, 2, 12345647);
	
INSERT INTO notafiscal(
	"codNotaFiscal", "codVenda", numero)
	VALUES (2, 3, 655147);
	
INSERT INTO notafiscal(
	"codNotaFiscal", "codVenda", numero)
	VALUES (3, 4, 545967);
	
INSERT INTO notafiscal(
	"codNotaFiscal", "codVenda", numero)
	VALUES (4, 5, 873252);



-- Selects script
-- SELECT "codCliente", nome, cnpj
-- 	FROM cliente;

-- SELECT "codCliente", "codEndereco", logradouro, bairro, cidade, uf
-- 	FROM endereco;

-- SELECT "codMaterial", nome, descricao, preco
-- 	FROM material;

-- SELECT "codVenda", "codCliente", data_venda, valor_total
-- 	FROM venda;

-- SELECT "codItem", "codVenda", "codMaterial", quantidade, valordesconto
-- 	FROM  item;

-- SELECT "codNotaFiscal", "codVenda", numero
-- 	FROM notafiscal;

