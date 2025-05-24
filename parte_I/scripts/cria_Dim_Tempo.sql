--	SCRIPT PARA CRIAR A DIMENÇÃO TEMPO

--	LIMPAR AS TABELAS

DROP TABLE "VB_DIM_TEMPO_INSIGHTHUNTERS";

--	CRIAR TABELAS

CREATE TABLE "VB_DIM_TEMPO_INSIGHTHUNTERS" 
(
 sk_tempo NUMERIC (28) NOT NULL , 
 nm_grupo VARCHAR (30) NOT NULL , 
 dt_evento DATETIME NOT NULL , 
 nr_ano NUMERIC (4) NOT NULL , 
 nr_mes NUMERIC (2) NOT NULL , 
 nm_mes VARCHAR (15) NOT NULL , 
 nr_dia NUMERIC (28) NOT NULL , 
 nr_dia_semana NUMERIC (1) NOT NULL , 
 nm_dia_semana_extenso VARCHAR (20) NOT NULL , 
 nr_semestre NUMERIC (1) NOT NULL , 
 ds_semestre VARCHAR (30)NOT NULL , 
 ds_semestre_ano VARCHAR (40) NOT NULL , 
 nr_trimestre NUMERIC (1) NOT NULL , 
 ds_trimestre VARCHAR (30) NOT NULL , 
 nm_estacao_ano VARCHAR (30) NOT NULL , 
 ds_dia_util_feriado VARCHAR (13) NOT NULL , 
 ds_fim_semana VARCHAR (3) NOT NULL , 
 ds_data_extenso VARCHAR (60) , 
 dt_carga DATETIME 
);

-- Propriedades estendidas (MS_Description) para cada coluna:
EXEC sp_addextendedproperty 'MS_Description' , 'Esta é a Surrogate Key da Dimensão Tempo. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'sk_tempo' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa o nome do grupo do aluno que participou do desafio.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'NM_GRUPO' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber informações sobre a data, contendo dia mes ano hora minuto e segundo. Atributo obrigatório.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'dt_evento' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa o ano que ocorreu o evento na Dimensão Tempo. Seu conteúdo deve ser obrigatório e do tipo numérico.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'nr_ano' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa o mês que ocorreu o evento na Dimensão Tempo. Seu conteúdo deve ser obrigatório e do tipo numérico. Seus possíveis valores estão entre 1 e 12.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'nr_mes' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa o mês por extenso que ocorreu o evento na Dimensão Tempo. Seu conteúdo deve ser obrigatório e do tipo string. Os possíveis valores podem estar entre JANEIRO e DEZEMBRO.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'nm_mes' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa o dia do mês que ocorreu o evento na Dimensão Tempo. Seu conteúdo deve ser obrigatório e do tipo numérico. Os valores devem estar entre 1 e 31.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'nr_dia' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa o número do dia da semana que ocorreu o evento na Dimensão Tempo. Seu conteúdo deve ser obrigatório e do tipo numérico. Os valores devem estar entre 1 e 7, onde 1 representa o dia de domingo e 7 o dia de sábado.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'nr_dia_semana' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa o dia por extenso da semana que ocorreu o evento na Dimensão Tempo. Seu conteúdo deve ser obrigatório e do tipo string.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'nm_dia_semana_extenso' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa o número do semestre que ocorreu o evento na Dimensão Tempo. Seu conteúdo deve ser obrigatório e do tipo numérico. Possíveis valores: 1 e 2.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'nr_semestre' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa a descrição do semestre da data do evento. Valores possíveis: 1o. SEMESTRE ou 2o. SEMESTRE' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'ds_semestre' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa a descrição do semestre da data do evento. Valores possíveis: 1o. SEMESTRE/2025 ou 2o. SEMESTRE/2205' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'ds_semestre_ano' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa o número do trimestre que ocorreu o evento na Dimensão Tempo. Seu conteúdo deve ser obrigatório e do tipo numérico. Possíveis valores: 1, 2, 3 e 4.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'nr_trimestre' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa a descrição do trimestre que ocorreu o evento na Dimensão Tempo. Valores possíveis: PRIMEIRO TRIMESTRE, SEGUNDO TRIMESTRE, TERCEIRO TRIMESTRE ou QUARTO TRIMESTRE.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'ds_trimestre' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa a descrição da Estação do ano da data do evento. Valores possíveis: VERÃO, OUTONO, INVERNO e PRIMAVERA.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'nm_estacao_ano' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa se a data em questão é um dia útil, fim de semana ou feriado. Valores possíveis: DIA ÚTIL, FIM DE SEMANA ou FERIADO.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'ds_dia_util_feriado' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este dado representa se a data em questão é um fim de semana ou não. Valores possíveis: SIM ou NÃO.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'ds_fim_semana' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a data por extenso.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'ds_data_extenso' 
;

EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a data da carga.' , 'USER' , 'dbo' , 'TABLE' , 'VB_DIM_TEMPO_INSIGHTHUNTERS' , 'COLUMN' , 'dt_carga' 
;

-- Constraints:
ALTER TABLE "VB_DIM_TEMPO_INSIGHTHUNTERS" 
ADD CONSTRAINT SK_VB_DIM_TEMPO PRIMARY KEY CLUSTERED (sk_tempo)
WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
