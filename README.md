![](img/banner.png "Title")

## Descrição 

Boas-vindas!

Você foi contratado(a) como pessoa cientista de dados para trabalhar em um banco digital internacional chamado Alura Cash. Na primeira reunião do seu novo trabalho, a diretoria financeira informa que, recorrentemente, estão surgindo pessoas inadimplentes após a liberação de créditos. Portanto, é solicitada uma solução para que seja possível diminuir as perdas financeiras por conta de pessoas mutuarias que não quitam suas dívidas.

Como cientista de dados, você sugere um estudo das informações financeiras e de solicitação de empréstimo para encontrar padrões que possam indicar uma possível inadimplência.

Desse modo, você solicita um conjunto de dados que contenha as informações de clientes, da solicitação de empréstimo, do histórico de crédito, bem como se a pessoa mutuaria é inadimplente ou não. Com esses dados, você sabe que consegue modelar um classificador capaz de encontrar potenciais clientes inadimplentes e solucionar o problema do Alura Cash.

## Semana 1

Objetivos:
- [X] Instalar MySQL Workbench e importar **database dump**.
- [X] Entender quais informações o conjunto de dados possui.
- [X] Analisar quais os tipos de dados.
- [X] Verificar quais são as inconsistências nos dados.
- [X] Corrigir as inconsistências nos dados.
- [X] Unir as tabelas de dados de acordo com os IDs.
- [X] Traduzir as colunas.
- [X] Exportar a tabela de dados unidos como csv.

**1.** Primeiramente foi instalado o SGBD MySQL Workbench e importado o database dump, disponibilizado pela Alura Cash [aqui](https://github.com/Mirlaa/Challenge-Data-Science-1ed/tree/main/Dados/dumps).
- [X] Instalar MySQL Workbench e importar **database dump**.

**2.** A segunda tarefa fiu entender o conjuntos de dados disponibilizados. São 4 tabelas que são explicadas abaixo:

• **dados_mutuarios:** Tabela contendo os dados pessoais de cada solicitante;

• **emprestimos:** Tabela contendo as informações do empréstimo solicitado;

• **historicos_banco:** Histório de emprétimos de cada cliente;

• **id:** Tabela que relaciona os IDs de cada informação da pessoa solicitante.

- [X] Entender quais informações o conjunto de dados possui.

**3.** A terceira etapa solicita a análise dos tipos de dados. Neste [link](https://github.com/Mirlaa/Challenge-Data-Science-1ed/tree/main/Dados) foi fornecido o dicionário da Alura Cash, porém os tipos não foram especificados. Abaixo representei em tabelas os tipos de cada coluna do dataset:

### dados_mutuarios

| Feature | Tipo |
| --- | --- |
|`person_id`|**VARCHAR(16)**|
| `person_age` |**INT**|
| `person_income` |**INT**|
| `person_home_ownership` |**VARCHAR(8)**|
| `person_emp_length` |**DOUBLE**|

### emprestimos

| Feature | Tipo |
| --- | --- |
|`loan_id`|**VARCHAR(16)**|
| `loan_intent` |**VARCHAR(32)**|
| `loan_grade` | **VARCHAR(1)** |
| `loan_amnt` | **INT** |
| `loan_int_rate` | **DOUBLE** |
| `loan_status` | **INT** |
| `loan_percent_income` | **DOUBLE** |


### historicos_banco

| Feature | Tipo |
| --- | --- |
|`cb_id`|**VARCHAR(16)**|
| `cb_person_default_on_file` |**VARCHAR(1)**|
| `cb_person_cred_hist_length` |**INT**|

### id

| Feature | Tipo |
| --- | --- |
|`person_id`|**VARCHAR(16)**|
|`loan_id`|**VARCHAR(16)**|
|`cb_id`|**VARCHAR(16)**|

- [X] Analisar quais os tipos de dados.

**4.** Optei por traduzir as colunas primeiro antes de trata-las usando o seguinte comando:

```
ALTER TABLE nome_da_tabela RENAME COLUMN nome_antigo_da_coluna TO nome_novo_da_coluna;
```

Alguns registros das tabelas estão em inglês. Optei por traduzi-las também.

```
UPDATE nome_da_tabela SET nome_da_coluna ='registro_em_ptbr' WHERE nome_da_coluna = 'registro_em_ingles';
```

- [X] Traduzir as colunas.

**5.** Algumas da insconsistências de dados foram valores em branco nas colunas de ID.

- [X] Verificar quais são as inconsistências nos dados.

**6.** Essas insconsistências foram removidas, visto que sem o ID não seria possível fazer EDA desses registros.

- [X] Corrigir as inconsistências nos dados.

**7.** Para unificar as tabelas foi utilizado o comando INNER JOIN, no [arquivo .SQL](https://github.com/mvsampaio98/Alura_cash/blob/main/dumps/analise_risco_tratamento.sql) tem todos os detalhes de como foi feito tanto o tratamento quanto a união das tabelas.

- [X] Unir as tabelas de dados de acordo com os IDs.

**8.** A tabela foi exportada no formato .CSV para ser utilizada na semana seguinte.

- [X] Exportar a tabela de dados unidos como csv.
