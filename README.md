# Projeto de Transações, Backup e Recovery em Banco de Dados

Este projeto consiste em trabalhar com transações, backup e recovery em um banco de dados. O objetivo é executar modificações na base de dados de forma controlada, lidar com erros e realizar o backup/recovery dos dados.

## Transações

Nesta parte do projeto, são abordadas transações em banco de dados. É necessário desabilitar o autocommit para garantir a atomicidade das transações. Cada instrução SQL é confirmada somente ao final da transação.

- Exemplo de transação sem utilizar procedures:

  ```sql
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
  SET autocommit =Transações com Procedure

Transações com Procedure

Nesta parte do projeto, são abordadas transações dentro de uma procedure. É realizada uma verificação de erro e, caso necessário, é feito um ROLLBACK total ou parcial (SAVEPOINT).

Exemplo de transação com procedure: 

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

Backup e Recovery
Nesta parte do projeto, é abordado o backup e recovery de um banco de dados.

Utilize o mysqldump para realizar o backup do banco de dados e-commerce:

$ mysqldump -u username -p database_name > backup.sql


Para restaurar o backup e realizar o recovery do banco de dados:

$ mysql -u username -p database_name < backup.sql


Certifique-se de substituir "username" pelo seu nome de usuário do MySQL e "database_name" pelo nome do banco de dados que deseja fazer o backup/recovery.

Notas Adicionais
Este projeto é apenas um exemplo e deve ser adaptado às necessidades e à estrutura específica do seu sistema.

Sempre teste as transações, backup/recovery antes de executá-los em um ambiente de produção.

Caso tenha dúvidas ou precise de mais informações, consulte a documentação do seu SGBD ou entre em contato com a equipe responsável pelo banco de dados.
