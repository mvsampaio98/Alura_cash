## Criação do Database e Acesso

create database analise_de_risco;
use analise_de_risco;

## Visualizando tabelas importadas

select * from dados_mutuarios;
select * from emprestimos;
select * from historicos_banco;
select * from ids;

## Analisando os tipos de dados

describe analise_de_risco.dados_mutuarios;
describe analise_de_risco.emprestimos;
describe analise_de_risco.historicos_banco;
describe analise_de_risco.ids;

## Traduzindo as colunas

alter table dados_mutuarios rename column person_id to id_pessoa;
alter table dados_mutuarios rename column person_age to idade_pessoa;
alter table dados_mutuarios rename column person_income to salario_ano_pessoa;
alter table dados_mutuarios rename column person_home_ownership to propriedade_pessoa;
alter table dados_mutuarios rename column person_emp_length to anos_trabalhados_pessoa;

alter table emprestimos rename column loan_id to id_emprestimo;
alter table emprestimos rename column loan_intent to motivo_emprestimo;
alter table emprestimos rename column loan_grade to pontuacao_emprestimo;
alter table emprestimos rename column loan_amnt to valor_emprestimo;
alter table emprestimos rename column loan_int_rate to taxa_juros_emprestimo;
alter table emprestimos rename column loan_status to status_inadimplencia;
alter table emprestimos rename column loan_percent_income to percentual_emprestimo_salario;

alter table historicos_banco rename column cb_id to id_historico;
alter table historicos_banco rename column cb_person_default_on_file to verifica_inadimplencia;
alter table historicos_banco rename column cb_person_cred_hist_length to tempo_primeira_solicitacao;

alter table ids rename column person_id to id_pessoa;
alter table ids rename column loan_id to id_emprestimo;
alter table ids rename column cb_id to id_historico;

## Traduzindo Linhas das colunas

start transaction;

update dados_mutuarios set propriedade_pessoa='Aluguel' where propriedade_pessoa = 'Rent';
update dados_mutuarios set propriedade_pessoa='Hipoteca' where propriedade_pessoa = 'Mortgage';
update dados_mutuarios set propriedade_pessoa='Propria' where propriedade_pessoa = 'Own';
update dados_mutuarios set propriedade_pessoa='Outros' where propriedade_pessoa = 'Other';

commit;

start transaction;

update emprestimos set motivo_emprestimo='Pessoal' where motivo_emprestimo = 'Personal';
update emprestimos set motivo_emprestimo='Educativo' where motivo_emprestimo = 'Education';
update emprestimos set motivo_emprestimo='Medico' where motivo_emprestimo = 'Medical';
update emprestimos set motivo_emprestimo='Empreendimento' where motivo_emprestimo = 'Venture';
update emprestimos set motivo_emprestimo='Melhora_do_lar' where motivo_emprestimo = 'Homeimprovement';
update emprestimos set motivo_emprestimo='Pagamento_debitos' where motivo_emprestimo = 'Debtconsolidation';

commit;

## Verificando inconsistências nos dados de id

select id_pessoa from dados_mutuarios where id_pessoa = ''; # Existe 4 valores em branco no id_pessoa
select id_emprestimo from emprestimos where id_emprestimo = ''; # Não há valores em branco no id_emprestimo
select id_historico from historicos_banco where id_historico = ''; # Não há valores em branco no id_historico

## Tratando os dados inconsistentes

start transaction;

delete from dados_mutuarios where id_pessoa = '';
delete from ids where id_pessoa = '';

commit;

## Unindo tabelas e exportando o arquivo .csv

start transaction;

select m.id_pessoa, m.idade_pessoa, m.salario_ano_pessoa, m.propriedade_pessoa, m.anos_trabalhados_pessoa,
e.id_emprestimo, e.motivo_emprestimo, e.pontuacao_emprestimo, e.valor_emprestimo, e.taxa_juros_emprestimo, e.status_inadimplencia, e.status_inadimplencia,
h.id_historico, h.verifica_inadimplencia, h.tempo_primeira_solicitacao
from (((ids i inner join dados_mutuarios m on i.id_pessoa = m.id_pessoa) inner join emprestimos e on i.id_emprestimo = e.id_emprestimo) inner join historicos_banco h on i.id_historico = h.id_historico);

commit;