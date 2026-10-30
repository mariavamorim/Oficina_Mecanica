USE Oficina_mecanica;


-- Cria dois usuarios com permissoes diferentes
CREATE USER IF NOT EXISTS 'usuario_leitura'@'localhost'
IDENTIFIED BY 'Leitura@123';


CREATE USER IF NOT EXISTS 'usuario_atendente'@'localhost'
IDENTIFIED BY 'Atendente@123';




-- Usuario de leitura: pode apenas consultar os dados
GRANT SELECT ON Oficina_mecanica.*
TO 'usuario_leitura'@'localhost';




-- Usuario atendente: pode consultar e cadastrar dados
GRANT SELECT, INSERT, UPDATE ON Oficina_mecanica.*
TO 'usuario_atendente'@'localhost';




-- Mostra as permissoes concedidas
SHOW GRANTS FOR 'usuario_leitura'@'localhost';


SHOW GRANTS FOR 'usuario_atendente'@'localhost';




-- Remove a permissao de UPDATE do atendente
REVOKE UPDATE ON Oficina_mecanica.*
FROM 'usuario_atendente'@'localhost';




-- Mostra as permissoes depois do REVOKE
SHOW GRANTS FOR 'usuario_atendente'@'localhost';