> <B>⚠️ Esse README ainda esta sob construção</B>

> <B>⚠️ Don't speak Portuguese? access the <a href=''>EN version</a></B>

<h1 align="center">
<h1 align="center">
  <br>
  <img src="https://github.com/CatarinaRRF/Challenge-Alura-Cash-19-08-22/blob/main/media/logo_alura_cash.png" alt="logo">
</h1>

<h3 align="center">Challenge Dados 1° Edição - Alura Cash</h3>

<p align="center">
    <a href="">
    <img src="https://img.shields.io/github/last-commit/CatarinaRRF/Challenge-Alura-Cash-19-08-22?color=informational&style=flat-square"
         alt="GitHub last commit">
    <a href="https://github.com/CatarinaRRF/Challenge-Alura-Cash-19-08-22">
    <img src= http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=green&style=flat-square >

</p>

<p align="center">
  <a href="#sobre">Sobre</a> •
  <a href="#metodologia">Metodologia</a> •
  <a href="#resultados">Resultados</a> •
  <a href="#arquivos">Arquivos</a> •
  <a href="#conclusão">Conclusão</a> •
  <a href="#creditos">Creditos</a>
  
</p>

## Sobre 

<p align="justify"> O banco digital internacional chamado Alura Cash se encontra com um problema em que, recorrentemente, estão surgindo pessoas inadimplentes após a liberação de créditos. Por está razão, foi requisitado uma solução para diminuir as perdas financeiras geradas por pessoas mutuárias que não quitam suas dívidas. Sendo assim, o participante solicitou um conjunto de dados contendo as informações de clientes, da solicitação de empréstimo, do histórico de crédito, bem como se a pessoa mutuária é inadimplente ou não, a fim de realizar uma análise dos dados, de acordo, com o interesse das partes interessadas.</p>

## Metodologia
<p align="justify"> Para a realização do projeto requisitado, o mesmo será dividido entre 4 partes, que contemplaram as fases da pipeline de dados, sendo elas limpeza, Análise Exploratória, Modelagem e Visualização dos dados.

Na fase de <b>limpeza os dados</b> será certificado se os atributos e entidades são válidos, completos e limpos para permitir o inicio de qualquer análise. Uma boa adequação significa que os dados são relevantes e que vão ajudar a resolver o problema de negócios apresentado ou determinar um curso de ação para atingir o objetivo da alura cash.

Na fase de <b>análise exploratória</b> será usada de estatísticas para coletar, revisar, analisar e tirar conclusões de dados, bem como aplicar modelos matemáticos quantificados a variáveis. Além disso, na fase de <b>modelagem</b>, as estatísticas também estaram no centro dos algoritmos de machine learning produzidos, capturando e traduzindo padrões de dados em evidências acionáveis.

Por fim, será realizado um <b>dashboard</b> que contém indicadores e métricas referentes as descobertas durante o processo de análise dos dados. A fim de demonstrar para os stakehoadas uma noção global dos processos de liberação de créditos, visualizando também, de forma dinâmica e objetiva, dados referentes a inadimplencia de emprestimos na empresa.</p>

### <i>Tecnologias</i>
Desse modo, cada uma também utilizará de softwares mais adequados para sua realização.

* <b>Limpeza de dados:</b> MySQL
* <b>Análise Exploratória de Dados:</b> Jupyter Notebook e Bibliotecas Python 
* <b>Modelagem dos Dados</b>: Biblioteca Python Sklearn
* <b>Visualização de dados:</b> Power BI 

## Resultados
Aqui se encontra resumido o que foi feito durante cada etapa

### <i>Limpeza de Dados</i>

<p align="justify">A limpeza de dados é o processo de corrigir ou remover dados incorretos, corrompidos, formatados incorretamente, duplicados ou incompletos em um conjunto de dados. Desse modo, foi identificado e corrigido os problemas encontrados no dataset da Alura Cash com a intenção de estruturar esses dados, de modo que, sejam consistentes e permitam uma análise autêntica ao requisitado pelas partes interessadas. Abaixo um resumo de quais foram essas mudanças e a justificativa para tais:</p>

<b>📂 Tabela: informações de clientes mutuários</b>

* Excluiu linhas no atributo `person_id` que possui valores nulos, pois não podem existir dois clientes com o mesmo id;
* Excluiu valores duplicados da coluna `person_id`;
* Trasformou `person_id` em chave primaria, pois é um campo com valores exclusivos;
* Traduziu os atributos de inglês para português para facilitar a interpretação;
* Trocou o tipo de dados da coluna `person_emp_length` de <b>double</b> para <b>int</b>, pois é um dado com números exatos. Outras colunas não apresentam o problema;
* Foi identicado na coluna `idade` a presença de clientes com idade igual a <b>123 anos</b> e <b>144 anos</b>, o que não é possivel, visto que a pessoa mais velha da história chegou até 122 anos<sup><a href='https://pt.wikipedia.org/wiki/Lista_das_pessoas_mais_velhas_do_mundo#:~:text=O%20t%C3%ADtulo%20de%20pessoa%20mais,118%20anos%20e%20210%20dias.'> [1]</a></sup> . Esses dados forma substituidos pela média de idade no Brasil que é ≅ 77 anos <sup><a href='https://agenciabrasil.ebc.com.br/geral/noticia/2021-11/expectativa-de-vida-no-brasil-sobe-para-768-anos#:~:text=A%20expectativa%20de%20vida%20no,%2C%20at%C3%A9%2076%2C6%20anos.'>[2]</a></sup>;
* Foi identicado na coluna `tempo_de_serviço` a presença de clientes com tempo trabalhando igula a <b>123 anos</b>, o que não é possivel, visto que a pessoa mais velha da história chegou até 122 e que o funcionário mais antigo do mundo trabalhou pro 84 anos <sup><a href='https://www.istoedinheiro.com.br/funcionario-mais-antigo-do-mundo-e-brasileiro-e-completou-100-anos/'>[3]</a></sup> . Além disso, as idades informadas nestas linhas são de 21 e 22 anos, o que faz esse tempo de trabalho improvavel. Logo, esses dados foram substituidos pela média de tempo de trabalho a partir dessa idade, sendo esta ≅ 5 anos;
* Foram corrigidos Dados Nulos;

<b>📂 Tabela: Solicitação de empréstimo</b>

* Excluiu linhas no atributo `loan_id` que possui valores nulos, pois não podem existir dois clientes com o mesmo id;
* Excluiu valores duplicados da coluna `loan_id`;
* Trasformou `loan_id` em chave primaria, pois é um campo com valores exclusivos;
* Traduziu os atributos de inglês para português para facilitar a interpretação;
* Trocou o tipo de dados da coluna `loan_status` de <b>int</b> para <b>BIT(1)</b>, pois é um dado do tipo booleano. Outras colunas não apresentam o problema;
* Foram corrigidos Dados Nulos;


<b>📂 Tabela: Histórico Referentes ao Banco</b>

* Excluiu linhas no atributo `cb_id` que possui valores nulos, pois não podem existir dois clientes com o mesmo id;
* Excluiu valores duplicados da coluna `cb_id`;
* Trasformou `cb_id` em chave primaria, pois é um campo com valores exclusivos;
* Traduziu os atributos de inglês para português para facilitar a interpretação;
* Foram corrigidos Dados Nulos;

<b>📂 Tabela: Ids</b>

* Adicionou Foreign Keys em `cb_id`, `loan_id` e `person_id`;

Após a estruturação do banco de dados, as informações foram concatenadas e exportadas para um arquivo csv com a intenção de facilitar a análise exploratória de dados na proxima etapa. O banco de dados ficou da seguinte forma:

<h4 align="center">Banco de dados antes de Alterações</h4>

<p align="center"><img src='https://github.com/CatarinaRRF/Challenge-Alura-Cash-19-08-22/blob/8ea86a2a599618193d451bacdb9575a8528cfcc1/dados/modelo_database_antes_de_mudan%C3%A7as.png'></p>

<h4 align="center">Banco de dados depois de Alterações</h4>

<p align="center"><img src='https://github.com/CatarinaRRF/Challenge-Alura-Cash-19-08-22/blob/8ea86a2a599618193d451bacdb9575a8528cfcc1/dados/dados_alterados/modelo_database_depois_de_mudan%C3%A7as.png'></p>

<b><sup>Para mais detalhes acesse o <a href='https://github.com/CatarinaRRF/Challenge-Alura-Cash-19-08-22/blob/4650394ec5d88ab400abb05d0803298aff035d4b/dados/dados_alterados/clean_data_alura_cash_2022.sql'>script</a> das mudanças realizadas</sup></b> 

### <i>Análise Exploratória de Dados</i>
*
*

### <i>Visualização de Dados</i>
*
*

## Arquivos

<img align="right" height="150" src="https://img.freepik.com/vetores-gratis/caixa-de-armazenamento-de-arquivamento-de-arquivos-de-gabinete-de-documentos_33099-829.jpg?w=740&t=st=1662167069~exp=1662167669~hmac=fb6f9c20366de7cfa78155d9e4e0219a230a9affa0fccec9c10875147c2d2c85">

* Dados <i>"Crus"</i> <a href='https://github.com/CatarinaRRF/Challenge-Alura-Cash-19-08-22/tree/4650394ec5d88ab400abb05d0803298aff035d4b/dados'>Link</a>
* Dados processados pós limpeza de dados <a href='https://github.com/CatarinaRRF/Challenge-Alura-Cash-19-08-22/blob/4650394ec5d88ab400abb05d0803298aff035d4b/dados/dados_alterados/clean_data_alura_cash.csv'>Link</a>
* Notebooks da Análise Exploratória de Dados <a href=''>Link</a>
* Notebooks da Modelagem de Dados <a href=''>Link</a>
* Dashboard <a href=''>Link</a>

## Conclusão
<p align="justify">Em linhas gerais, constatou-se que <b>Lorem ipsum dolor sit amet</b>. Verifica-se, portanto, <b>consectetur adipiscing elit</b>. Ademais, verifica-se <b>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</b>.

Cabe destacar ainda que Lorem ipsum dolor sit amet.
</p>

## Creditos
* Challenge desenvolvido pelo Scuba Team da escola de tecnologia <a href='https://www.alura.com.br/'>Alura</a> <sup><img src='https://user-images.githubusercontent.com/105402331/187300705-229c3543-398f-41b5-9e23-44bbf5796f21.png' height=10px></sup>

<img src="https://github.com/CatarinaRRF/Challenge-Alura-Cash-19-08-22/blob/974dd832c3980dd107a36a4b6906b616bb7b71f2/media/hr_line_redme.png" alt="logo">

<p align="center">
 <a href='https://www.linkedin.com/public-profile'><img src='https://cdn-icons-png.flaticon.com/512/174/174857.png' height=20px></a> <a href='https://www.kaggle.com/ccfreitas'><img src='https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/189_Kaggle_logo_logos-512.png' height=20px></a>
</p>

