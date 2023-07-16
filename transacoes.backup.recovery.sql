-- Parte 1 - Transações

-- Desabilitar o autocommit
SET autocommit = 0;

-- Iniciar a transação
START TRANSACTION;

-- Executar as instruções SQL
INSERT INTO tabela1 (coluna1, coluna2) VALUES (valor1, valor2);
UPDATE tabela2 SET coluna1 = novo_valor WHERE condição;
DELETE FROM tabela3 WHERE condição;

-- Confirmar a transação
COMMIT;

-- Habilitar o autocommit novamente
SET autocommit = 1;

-- Parte 2 - Transação com Procedure

-- Criação da procedure
DELIMITER //

CREATE PROCEDURE minha_procedure()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    -- Desabilitar o autocommit
    SET autocommit = 0;

    -- Iniciar a transação
    START TRANSACTION;

    -- Executar as instruções SQL
    INSERT INTO tabela1 (coluna1, coluna2) VALUES (valor1, valor2);
    UPDATE tabela2 SET coluna1 = novo_valor WHERE condição;
    DELETE FROM tabela3 WHERE condição;

    -- Verificar se ocorreu algum erro
    IF erro THEN
        -- ROLLBACK total
        ROLLBACK;
    ELSE
        -- Confirmar a transação
        COMMIT;
    END IF;

    -- Habilitar o autocommit novamente
    SET autocommit = 1;
END //

DELIMITER ;

-- Parte 3 - Backup e Recovery

-- Utilize o mysqldump para realizar o backup do banco de dados e-commerce:
-- $ mysqldump -u username -p database_name > backup.sql

-- Para restaurar o backup e realizar o recovery do banco de dados:
-- $ mysql -u username -p database_name < backup.sql

