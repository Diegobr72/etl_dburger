# 🕒 Projeto ETL - Dimensão Tempo | DBurger (INSIGHTHUNTERS)

Este repositório documenta o desenvolvimento do processo de ETL da dimensão tempo **VB_DIM_TEMPO_INSIGHTHUNTERS**, implementado no **Azure SQL Database** por meio do **Azure Data Factory (ADF)**.  
O projeto foi desenvolvido como parte do 3º checkpoint da disciplina, atendendo às necessidades analíticas da hamburgueria **DBurger** para a estruturação do seu Data Mart comercial.

---

## 📌 Objetivo

Construir a dimensão temporal completa, enriquecida com informações de feriados, estações do ano e outros atributos derivados, a partir de fontes externas, e carregá-la no Azure SQL utilizando um pipeline orquestrado no Azure Data Factory.

---

## ⚙️ Tecnologias Utilizadas

- **Azure Data Factory**  
- **Azure SQL Database**  
- **Azure Blob Storage**  
- **Power Query / Data Flows**  
- **SQL**  
- **Excel & CSV** como fontes de dados  

---

## 📁 Estrutura do Repositório

```
INSIGHTHUNTERS_ETL_TEMPO/
├── README.md                       # Este arquivo
├── docs/
│   └── INSIGHTHUNTERS_ETL_TEMPO.docx  # Documentação técnica com screenshots
├── data/
│   ├── calendario_2023_2024_2025.xlsx # Base de datas e feriados
│   └── detalhes_feriado_2023_2024_2025.csv # Detalhes complementares dos feriados
├── scripts/
│   └── cria_Dim_Tempo.sql           # Script SQL de criação da tabela destino
└── output/
    └── INSIGHTHUNTERS_dados_processados.xlsx # Resultado final da carga ETL
```

---

## 🧱 Pré-Requisitos

- Conta ativa no **Microsoft Azure**  
- Acesso aos seguintes serviços:
  - Azure Data Factory  
  - Azure SQL Database  
  - Azure Blob Storage  
- Arquivos de dados (disponíveis na pasta `data/`)  
- Script SQL para criação da tabela destino (`scripts/cria_Dim_Tempo.sql`)  

---

## 🏗️ Passo a Passo da Implementação

### 1. Criação da Tabela no Azure SQL

Execute o script `scripts/cria_Dim_Tempo.sql` para criar a tabela `VB_DIM_TEMPO_INSIGHTHUNTERS`:

\`\`\`sql
CREATE TABLE VB_DIM_TEMPO_INSIGHTHUNTERS (
    sk_tempo NUMERIC PRIMARY KEY,
    nm_grupo VARCHAR(30),
    dt_evento DATE,
    nr_ano NUMERIC(4),
    nr_mes NUMERIC(2),
    nm_mes VARCHAR(15),
    nr_dia NUMERIC,
    nr_dia_semana NUMERIC(1),
    nm_dia_semana_extenso VARCHAR(20),
    nr_semestre NUMERIC(1),
    ds_semestre VARCHAR(30),
    ds_semestre_ano VARCHAR(40),
    nr_trimestre NUMERIC(1),
    ds_trimestre VARCHAR(30),
    nm_estacao_ano VARCHAR(30),
    ds_dia_util_feriado VARCHAR(12),
    ds_fim_semana VARCHAR(3),
    ds_data_extenso VARCHAR(60),
    dt_carga DATE
);
\`\`\`

---

### 2. Configuração no Azure Data Factory

#### 🔗 Linked Services
- **Azure SQL Database**  
- **Azure Blob Storage**  

#### 📦 Datasets
- `calendario_2023_2024_2025.xlsx`  
- `detalhes_feriado_2023_2024_2025.csv`  

#### 🧪 Pipeline ETL

1. **Extração**  
   - Leitura dos arquivos `.xlsx` e `.csv` a partir do Blob Storage.  
2. **Transformação**  
   - Derivação de colunas como:
     - `nm_mes` (ex: `5` → `MAIO`)
     - `nm_dia_semana_extenso` (ex: `1` → `Domingo`)
     - `ds_data_extenso` (ex: `Domingo, 18 de Maio de 2025`)
   - Categorização por semestre, trimestre, estação, feriados e finais de semana.  
3. **Carga**  
   - Inserção dos dados transformados na tabela `VB_DIM_TEMPO_INSIGHTHUNTERS`.  
   - Geração de um arquivo Excel com os dados carregados (em `output/`).  

---

## ✅ Entregáveis

- **Documentação Técnica** (`docs/INSIGHTHUNTERS_ETL_TEMPO.docx`)  
  - Descrição do fluxo no ADF  
  - Capturas de tela com RM visível  
  - Evidências da carga na tabela  
  - Identificação da equipe (nomes e RMs)  
- **Arquivo de Saída**  
  - `output/INSIGHTHUNTERS_dados_processados.xlsx`: dados resultantes após execução do pipeline  

---

## 🚀 Execução

1. Execute o pipeline diretamente no Azure Data Factory.  
2. Monitore as atividades e valide a execução.  
3. Verifique os dados no banco com:
   \`\`\`sql
   SELECT TOP 10 * 
   FROM VB_DIM_TEMPO_INSIGHTHUNTERS;
   \`\`\`
4. Analise o arquivo gerado em `output/INSIGHTHUNTERS_dados_processados.xlsx`.  

---

## 👥 Equipe INSIGHTHUNTERS

| Nome                                      | RM     |
| ----------------------------------------- | ------ |
| Diego Alves Moreira                       | 55260  |
| João Pedro de Souza Nunes                 | 554066 |
| Guilherme Yuiti Matsushita Nakamura       | 85355  |

**Professores Orientadores:**  
- Salvio Padlipskas  
