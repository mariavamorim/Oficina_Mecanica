Banco de Dados — Oficina MecânicaIntegrantes
 Acosta
 Mavi
 Arthur

Descrição do projeto
Este projeto consiste em um banco de dados para uma oficina mecânica, desenvolvido para organizar e gerenciar informações sobre clientes, veículos, mecânicos, serviços, peças e ordens de serviço.

Tecnologias utilizadas
MySQL / MariaDB
MySQL Workbench
SQL

Estrutura do banco de dados
O banco de dados possui 7 tabelas:
clientes
veiculos
mecanicos
servicos
pecas
ordens_servico
itens_os

O modelo contém chaves primárias, chaves estrangeiras e relacionamentos entre as tabelas.

Recursos SQL utilizados
CREATE TABLE, INSERT e outras operações SQL
INNER JOIN e LEFT JOIN
VIEW
FUNCTION
STORED PROCEDURE com validações
TRIGGER para atualização automática do estoque
CREATE USER, GRANT e REVOKE

Como executar o projeto
Execute os arquivos SQL na seguinte ordem:
01_schema_ddl.sql — criação do banco e das tabelas.
02_carga_dml.sql — inserção dos dados iniciais.
03_joins_views.sql — consultas e criação da VIEW.
04_functions_procedures_triggers.sql — criação da FUNCTION, PROCEDURE e TRIGGER.
05_usuarios_grants.sql — criação dos usuários e configuração das permissões.

O arquivo 06_roteiro_apresentacao.sql contém o roteiro da apresentação do projeto.

Modelo do banco de dados
O diagrama entidade-relacionamento (DER) está disponível no arquivo DER_Oficina_Mecanica.png.