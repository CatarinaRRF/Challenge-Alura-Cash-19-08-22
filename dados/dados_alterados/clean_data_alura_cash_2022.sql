-- Data Cleaning com MySQL do DB da ALura Ca$h alter
-- Desenvolvido em 09/09/2022
--
-- Host: localhost    Database: db_alura_cash_2022
-- ------------------------------------------------------
SET SQL_SAFE_UPDATES=0;

-- alterando `dados_mutuarios`
-- ------------------------------------------------------
SELECT COUNT(DISTINCT(`person_id`)) AS UNICOS_DM, COUNT(`person_id`) AS TOTAL_DM 
FROM dados_mutuarios;

SELECT person_id, COUNT(person_id)
FROM dados_mutuarios
GROUP BY person_id
HAVING COUNT(person_id) > 1;

DELETE FROM dados_mutuarios WHERE person_id='';

ALTER TABLE dados_mutuarios
ADD PRIMARY KEY (`person_id`),
CHANGE person_id person_id VARCHAR(16) NOT NULL UNIQUE,
CHANGE person_age idade int,
CHANGE person_income salario_anual int,
CHANGE person_home_ownership situ_propriedades varchar(8),
CHANGE person_emp_length tempo_de_serviço int;

-- concertando idades acima de 122
SELECT DISTINCT(idade) 
FROM dados_mutuarios;

UPDATE dados_mutuarios SET idade = REPLACE(idade, '123', '77') WHERE idade = 123;
UPDATE dados_mutuarios SET idade = REPLACE(idade, '144', '77') WHERE idade = 144;

-- concertando tempo de serviço de 122 ano
SELECT * 
FROM dados_mutuarios 
WHERE tempo_de_serviço > 122;

SELECT AVG(tempo_de_serviço)
FROM dados_mutuarios 
WHERE idade > 20 | idade < 23;

UPDATE dados_mutuarios SET tempo_de_serviço = REPLACE(tempo_de_serviço, '123', '5') WHERE tempo_de_serviço > 120;

-- alterando `emprestimos`
-- ------------------------------------------------------
SELECT COUNT(DISTINCT(`loan_id`)) AS UNICOS_E, COUNT(`loan_id`) AS TOTAL_E 
FROM emprestimos;

ALTER TABLE emprestimos
ADD PRIMARY KEY (`loan_id`),
CHANGE loan_id loan_id VARCHAR(16) NOT NULL UNIQUE, 
CHANGE loan_intent intencao_emprestimo varchar(32),
CHANGE loan_grade score_de_crédito varchar(1),
CHANGE loan_amnt total_emprestimo int,
CHANGE loan_int_rate taxa_de_juros double,
CHANGE loan_status possibilidade_inadimplência BIT(1),
CHANGE loan_percent_income renda_percentual double; 

-- alterando `historicos_banco`
-- ------------------------------------------------------
SELECT COUNT(DISTINCT(`cb_id`)) AS UNICOS_HB, COUNT(`cb_id`) AS TOTAL_HB 
FROM historicos_banco;

ALTER TABLE historicos_banco
ADD PRIMARY KEY (`cb_id`),
CHANGE cb_id cb_id VARCHAR(16) NOT NULL UNIQUE,
CHANGE cb_person_default_on_file hist_inadimplencia varchar(1),
CHANGE cb_person_cred_hist_length hist_solicitacao_credito int;

-- alterando ids
-- ------------------------------------------------------
ALTER TABLE ids
ADD FOREIGN KEY (`person_id`) REFERENCES dados_mutuarios(`person_id`),
ADD FOREIGN KEY (`loan_id`) REFERENCES emprestimos(`loan_id`),
ADD FOREIGN KEY (`cb_id`) REFERENCES historicos_banco(`cb_id`);

-- concatenando os dados em apenas uma tabela
-- ------------------------------------------------------
CREATE TABLE dados_juntos AS SELECT 
dm.idade,
dm.salario_anual,
dm.situ_propriedades,
dm.tempo_de_serviço,
e.intencao_emprestimo,
e.score_de_crédito,
e.total_emprestimo,
e.taxa_de_juros,
e.possibilidade_inadimplência,
e.renda_percentual,
hb.hist_inadimplencia,
hb.hist_solicitacao_credito

FROM ids i
JOIN dados_mutuarios dm ON dm.person_id = i.person_id 
JOIN emprestimos e ON e.loan_id = i.loan_id 
JOIN historicos_banco hb ON hb.cb_id = i.cb_id;

-- Exportanto dados_juntos como artigo csv
-- ------------------------------------------------------
SELECT * 
FROM dados_juntos
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clean_data_alura_cash.csv';
