USE Oficina_mecanica;


-- FUNCTION: calcula o valor total das pecas
DROP FUNCTION IF EXISTS calcular_total_pecas;


DELIMITER //


CREATE FUNCTION calcular_total_pecas(
    quantidade INT,
    valor_unitario DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN quantidade * valor_unitario;
END //


DELIMITER ;




-- PROCEDURE: cadastra uma ordem de servico
DROP PROCEDURE IF EXISTS cadastrar_ordem;


DELIMITER //


CREATE PROCEDURE cadastrar_ordem(
    IN p_idVeiculos INT,
    IN p_idMecanicos INT,
    IN p_idServicos INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM veiculos
        WHERE idVeiculos = p_idVeiculos
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Veiculo nao encontrado';
    END IF;


    IF NOT EXISTS (
        SELECT 1 FROM mecanicos
        WHERE idMecanicos = p_idMecanicos
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Mecanico nao encontrado';
    END IF;


    IF NOT EXISTS (
        SELECT 1 FROM servicos
        WHERE idServicos = p_idServicos
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Servico nao encontrado';
    END IF;


    INSERT INTO ordens_servico
    (Data_abertura, Data_conclusao, Status,
     idVeiculos, idMecanicos, idServicos)
    VALUES
    (NOW(), NULL, 'Aberta',
     p_idVeiculos, p_idMecanicos, p_idServicos);
END //


DELIMITER ;




-- TRIGGER: atualiza o estoque ao adicionar uma peca
DROP TRIGGER IF EXISTS atualizar_estoque;


DELIMITER //


CREATE TRIGGER atualizar_estoque
AFTER INSERT ON itens_os
FOR EACH ROW
BEGIN
    UPDATE pecas
    SET Quantidade_estoque = Quantidade_estoque - NEW.Quantidade
    WHERE idPecas = NEW.idPecas;
END //


DELIMITER ;