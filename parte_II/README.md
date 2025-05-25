## 📊 Projeto ETL – Fato Vendas (DBurger – Parte II)

Este repositório reúne a segunda etapa do projeto acadêmico desenvolvido para atender à **VendeBem**, cujo objetivo é construir a dimensão de faixa etária e clientes, unificando na fato Venda em um ambiente Azure, empregando **Azure Data Factory (ADF)** e **Azure SQL Database**.

---

### 🎯 Objetivo
Gerar um pipeline ETL robusto que:

- Calcule a idade dos clientes a partir da data de nascimento.
- Classifique cada cliente em uma faixa etária definida.
- Associe estratégias comerciais adequadas a cada faixa.
- Carregue os dados transformados em tabelas SQL para posterior análise e segmentação.

---

### 📝 Estrutura do Repositório

```plaintext
INSIGHTHUNTERS_ETL_FAIXA_ETARIA/
├── README.md
├── docs/
│   ├── 1_evidencias.pdf       
│   ├── 2_evidencias.pdf       
│   └── 3_evidencias.pdf       
├── data/
│   └── Cadastro_Faixa_Etaria.xlsx  
├── scripts/
│   └── cria_VendeBem.sql       
├── adf/
│   └── (pasta do Azure Data Fatory)     
└── output/         
    └── INSIGHTHUNTERS_dados_processados.CSV          
```

---

### ⚙️ Pré-requisitos

1. **Conta Microsoft Azure** com permissão para criar e gerenciar:
   - Azure Blob Storage
   - Azure SQL Database
   - Azure Data Factory
2. **Oracle Database** acessível via view: `DBURGER.V_DB_CLI_3O_CHECKPOINT` (filtrada por `SG_ESTADO = 'SP'`).
3. **Ferramentas locais**:
   - [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
   - [SQL Server Management Studio](https://docs.microsoft.com/sql/ssms/download-sql-server-management-studio-ssms)
   - [Azure Data Factory Tools para Visual Studio ou VS Code](https://learn.microsoft.com/azure/data-factory/quickstart-create-data-factory-portal)

---

### 🛠️ Configuração e Implantação

#### 1. Provisionamento de Recursos

1. **Blob Storage**
   - Crie um *Storage Account* e um *Container* nomeado `ainsighthunters_rm<seu_rm>`.
   - Faça o upload de `data/Cadastro_Faixa_Etaria.xlsx`.

2. **Azure SQL Database**
   - Crie o banco de dados `dbinsighthunters_rm<seu_rm>`.
   - Conecte-se ao servidor e execute `scripts/cria_VendeBem.sql`.

3. **Azure Data Factory**
   - Importe o arquivo `pipelines/ADF_pipeline.json` ao seu Data Factory (menu *Author -> Import*).
   - Atualize conexões vinculadas (*Linked Services*) para apontar ao seu Blob Storage, Oracle e Azure SQL.

#### 2. Execução do Pipeline

- No portal Azure, acesse o Data Factory e selecione o pipeline **ETL_Faixa_Etaria**.
- Clique em **Trigger -> Trigger Now**.
- Acompanhe as atividades na *Monitor*.

---

### 🔄 Processo ETL Detalhado

1. **Ingestão**
   - Leitura de `Cadastro_Faixa_Etaria.xlsx` no Blob Storage.
   - Leitura da view Oracle filtrada por clientes de SP.

2. **Transformação**
   - Cálculo de idade: `DATEDIFF(year, DT_NASCIMENTO, GETDATE())`.
   - Junção com a tabela de faixas para classificação.
   - Atribuição de colunas derivadas:
     - `ESCOLARIDADE`: definido como *Superior Completo*.
     - `ESTADO_CIVIL`: definido como *Solteiro*.

3. **Carga**
   - Gravação na tabela `TB_CLIENTE_FAIXA_ETARIA` no Azure SQL Database.

> **Exemplo de definição da tabela de destino**:
>
> ```sql
> CREATE TABLE TB_CLIENTE_FAIXA_ETARIA (
>     ID_CLIENTE INT PRIMARY KEY,
>     NM_CLIENTE VARCHAR(100),
>     IDADE INT,
>     FAIXA_ETARIA VARCHAR(50),
>     ESTRATEGIA_COMERCIAL VARCHAR(200),
>     ESCOLARIDADE VARCHAR(50),
>     ESTADO_CIVIL VARCHAR(50)
> );
> ```

---

### 📂 Entregáveis e Evidências

1. **docs/1_evidencias.docx**: Capturas de tela do recurso de Blob Storage.
2. **docs/2_evidencias.docx**: Capturas de tela da criação e estrutura do Azure SQL.
3. **docs/3_evidencias.docx**: Fluxo completo do pipeline ADF e resultados antes e depois da carga.