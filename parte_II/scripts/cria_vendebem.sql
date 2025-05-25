-- SCRIPT PARA CRIAR A FATO VENDA E  AS DIMENÇÃO FAIXA_ETARIA E CLIENTE

--LIMPAR AS TABELAS

ALTER TABLE "VB_FTO_VENDA_INSIGHTHUNTERS" 
    DROP CONSTRAINT FK_VB_DIM_CLIENTE_VENDA;

ALTER TABLE "VB_FTO_VENDA_INSIGHTHUNTERS" 
    DROP CONSTRAINT FK_VB_FXA_ETARIA_CLI_VENDA;

DROP TABLE "VB_FTO_VENDA_INSIGHTHUNTERS";
DROP TABLE "VB_DIM_CLIENTE_INSIGHTHUNTERS";
DROP TABLE "VB_DIM_FAIXA_ETARIA_INSIGHTHUNTERS";

-- CRIAR TABELAS

CREATE TABLE "VB_DIM_CLIENTE_INSIGHTHUNTERS" 
    (
     sk_cliente NUMERIC (28) NOT NULL , 
     cd_cliente NUMERIC (28) NOT NULL , 
     nm_cliente VARCHAR (100) NOT NULL , 
     nr_cpf NUMERIC (12) NOT NULL , 
     ds_sexo VARCHAR (12) , 
     dt_nascimento DATE , 
     ds_escolaridade VARCHAR (30) , 
     ds_estado_civil VARCHAR (15) , 
     nm_estado VARCHAR (20) , 
     sg_estado CHAR (2) , 
     nm_cidade VARCHAR (50) , 
     nm_bairro VARCHAR (80) , 
     dt_inicio DATE NOT NULL , 
     dt_fim DATE 
    );

EXEC sp_addextendedproperty 'MS_Description' , 'Este  é a Surrogate Key da Dimensão Cliente. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_CLIENTE_INSIGHTHUNTERS' , 'COLUMN' , 'sk_cliente';

EXEC sp_addextendedproperty 'MS_Description' , 'Este é o código do vendedor da Dimensão Cliente. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_CLIENTE_INSIGHTHUNTERS' , 'COLUMN' , 'cd_cliente';

EXEC sp_addextendedproperty 'MS_Description' , 'Este  é o nome do vendedor da Dimensão Cliente. Seu conteúdo deve ser obrigatório e do tipo string.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_CLIENTE_INSIGHTHUNTERS' , 'COLUMN' , 'nm_cliente';

EXEC sp_addextendedproperty 'MS_Description' , 'Esta é numero do CPF do cliente da Dimensão Cliente. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_CLIENTE_INSIGHTHUNTERS' , 'COLUMN' , 'nr_cpf';

EXEC sp_addextendedproperty 'MS_Description' , 'Os tipos de sexo possíveis são: Feminino, Masculino e Hermafrodita.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_CLIENTE_INSIGHTHUNTERS' , 'COLUMN' , 'ds_sexo';

EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a data de inicio do cliente no modelo dimensional.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_CLIENTE_INSIGHTHUNTERS' , 'COLUMN' , 'dt_inicio';

EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a data de término do cliente no modelo dimensional.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_CLIENTE_INSIGHTHUNTERS' , 'COLUMN' , 'dt_fim';

ALTER TABLE "VB_DIM_CLIENTE_INSIGHTHUNTERS" ADD CONSTRAINT SK_VB_DIM_CLIENTE PRIMARY KEY CLUSTERED (sk_cliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON );

CREATE TABLE "VB_DIM_FAIXA_ETARIA_INSIGHTHUNTERS" 
    (
     sk_faixa_etaria NUMERIC (28) NOT NULL , 
     ds_faixa_etaria VARCHAR (200) NOT NULL , 
     qt_idade_inicial NUMERIC (3) NOT NULL , 
     qt_idade_final NUMERIC (3) NOT NULL 
    );

EXEC sp_addextendedproperty 'MS_Description' , 'Esta é a Surrogate Key da Dimensão Faixa Etaria. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_FAIXA_ETARIA_INSIGHTHUNTERS' , 'COLUMN' , 'sk_faixa_etaria';

EXEC sp_addextendedproperty 'MS_Description' , 'Esta é a descrição da faixa etaria onde o cliente se localiza no momento. Seu conteúdo deve ser obrigatório e do tipo string.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_FAIXA_ETARIA_INSIGHTHUNTERS' , 'COLUMN' , 'ds_faixa_etaria';

EXEC sp_addextendedproperty 'MS_Description' , 'Esta é a idade inicial da faixa etaria onde o cliente se localiza no momento. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_FAIXA_ETARIA_INSIGHTHUNTERS' , 'COLUMN' , 'qt_idade_inicial';

EXEC sp_addextendedproperty 'MS_Description' , 'Esta é a idade final  da faixa etaria onde o cliente se localiza no momento. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_FAIXA_ETARIA_INSIGHTHUNTERS' , 'COLUMN' , 'qt_idade_final';

ALTER TABLE "VB_DIM_FAIXA_ETARIA_INSIGHTHUNTERS" ADD CONSTRAINT SK_VB_DIM_FAIXA_ETARIA PRIMARY KEY CLUSTERED (sk_faixa_etaria)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON );

CREATE TABLE "VB_FTO_VENDA_INSIGHTHUNTERS" 
    (
     sk_cliente NUMERIC (28) NOT NULL , 
     sk_faixa_etaria NUMERIC (28) NOT NULL , 
     qt_total_vendida NUMERIC (8,2) NOT NULL , 
     vl_total_venda NUMERIC (12,2) NOT NULL , 
     qt_idade_cliente NUMERIC (3) NOT NULL 
    );

EXEC sp_addextendedproperty 'MS_Description' , 'Este  é a Surrogate Key da Dimensão Cliente. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_FTO_VENDA_INSIGHTHUNTERS' , 'COLUMN' , 'sk_cliente';

EXEC sp_addextendedproperty 'MS_Description' , 'Esta é a Surrogate Key da Dimensão Faixa Etaria. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_FTO_VENDA_INSIGHTHUNTERS' , 'COLUMN' , 'sk_faixa_etaria';

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa a quantidade de venda realizada. Seu conteúdo deve ser obrigatório e do tipo numérico com 2 casas decimais.' , 'USER' , 'dbo' , 'TABLE' , 'VB_FTO_VENDA_INSIGHTHUNTERS' , 'COLUMN' , 'qt_total_vendida';

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa a o valor total da venda realizada. Seu conteúdo deve ser obrigatório e do tipo numérico com 2 casas decimais.' , 'USER' , 'dbo' , 'TABLE' , 'VB_FTO_VENDA_INSIGHTHUNTERS' , 'COLUMN' , 'vl_total_venda';

EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a idade atual do cliente.' , 'USER' , 'dbo' , 'TABLE' , 'VB_FTO_VENDA_INSIGHTHUNTERS' , 'COLUMN' , 'qt_idade_cliente';

ALTER TABLE "VB_FTO_VENDA_INSIGHTHUNTERS" ADD CONSTRAINT SK_VB_FTO_VENDA PRIMARY KEY CLUSTERED (sk_cliente, sk_faixa_etaria)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON );

ALTER TABLE "VB_FTO_VENDA_INSIGHTHUNTERS" 
    ADD CONSTRAINT FK_VB_DIM_CLIENTE_VENDA FOREIGN KEY 
    ( 
     sk_cliente
    ) 
    REFERENCES "VB_DIM_CLIENTE_INSIGHTHUNTERS" 
    ( 
     sk_cliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION;

ALTER TABLE "VB_FTO_VENDA_INSIGHTHUNTERS" 
    ADD CONSTRAINT FK_VB_FXA_ETARIA_CLI_VENDA FOREIGN KEY 
    ( 
     sk_faixa_etaria
    ) 
    REFERENCES "VB_DIM_FAIXA_ETARIA_INSIGHTHUNTERS" 
    ( 
     sk_faixa_etaria 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION;