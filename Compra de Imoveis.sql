--Criar banco de dados

Create Database VendaImovel
go 
Use VendaImovel
go

--Criar Tabelas

Create Table Vendedor (
	cd_Vendedor int not null, 
	nm_Vendedor varchar(40),
	ds_Endereço varchar(40),
	cd_CPF varchar (15), 
	nm_Cidade varchar (40),
	nm_Bairro varchar (40),
	sg_Estado char (2),
	cd_Telefone varchar (20),
	ds_Email varchar(60)) 
	go

Create Table Imovel ( 
	cd_Imovel int not null,
	cd_Vendedor int not null, 
	cd_Bairro int not null,
	cd_Cidade int not null,
	sg_Estado char (2) not null,
	ds_Endereço varchar (40),
	qt_AreaUtil decimal (10,02),
	qt_AreaTotal decimal (10,02),
	ds_Imovel varchar (300),
	vl_Imovel money,
	qt_Ofertas int,
	ic_vendido char (1),
	dt_Lançamento datetime,
	qt_ImovelIndicado int )
	go

Create Table Comprador (
	cd_Comprador int not null, 
	nm_Comprador varchar (40),
	ds_Endereço varchar (40),
	cd_CPF varchar (15),
	nm_Cidade varchar (40),
	nm_Bairro varchar (40), 
	sg_Estado char (2),
	cd_Telefone varchar (20),
	ds_email varchar (60) )
	go

Create Table Oferta (
	cd_Comprador int not null, 
	cd_Imovel int not null,
	vl_Oferta money, 
	dt_Oferta datetime )
	go

Create Table Faixa_Imovel (
	cd_Faixa int not null, 
	nm_Faixa varchar (20),
	vl_Maximo money,
	vl_Minimo money )
	go 

Create Table Bairro (
	cd_Bairro int not null,
	cd_Cidade int not null, 
	sg_Estado Char (2)not null,
	nm_Bairro varchar (40) ) 
	go 

Create Table Cidade (
	cd_Cidade int not null,
	sg_Estado char (2)not null,
	nm_cidade varchar (40) )
	go

Create Table Estado (
	sg_Estado char (2)not null,
	nm_Estado varchar (40) )
	go

--Criar Chaves Primarias

Alter Table Vendedor
	add Primary Key (cd_vendedor)
	go

Alter Table Imovel
	add Primary Key (cd_Imovel)
	go

Alter Table Comprador
	add Primary Key (cd_Comprador)
	go 

Alter Table Oferta
	add Primary Key (cd_Comprador, cd_Imovel)
	go

Alter Table Faixa_Imovel
	add Primary Key (cd_Faixa)
	go

Alter Table Bairro
	add Primary Key (cd_Bairro, cd_Cidade, sg_Estado)
	go
	
Alter Table Cidade
	add Primary Key (cd_Cidade, sg_Estado)
	go

Alter Table Estado
	add Primary Key (sg_Estado)
	go

--Criar Chaves Estrangeiras

Alter Table Imovel
	add Foreign Key (cd_Bairro, cd_Cidade, sg_Estado)
	references Bairro
	go

Alter Table Imovel
	add Foreign Key (cd_vendedor)
	references Vendedor
	go

Alter Table Bairro
	add Foreign Key (cd_Cidade, sg_Estado)
	references Cidade
	go

Alter Table Cidade
	add Foreign Key (sg_Estado)
	references Estado
	go

Alter Table Oferta
	add Foreign Key (cd_Comprador)
	references Comprador
	go

Alter Table Oferta
	add Foreign Key (cd_Imovel)
	references Imovel
	go

--Criar Os Index

Create Index indImovelOferta
	on Oferta (cd_Imovel)
	go

Create Index indValorOferta
	on Oferta (vl_Oferta Desc)
	go
