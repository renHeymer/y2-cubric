DELIMITER $$

USE cm6211_1819_team_5 $$

DROP PROCEDURE IF EXISTS CreateNewUserRole $$

CREATE PROCEDURE CreateNewUserRole (varUsername VARCHAR(50), varRole VARCHAR(45))
BEGIN

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
     BEGIN
       ROLLBACK;
       SELECT 'An EXCEPTION has occurred' AS msg;
     END;

     DECLARE EXIT HANDLER FOR SQLSTATE '23000'
     BEGIN
       ROLLBACK;
       SELECT 'You have attempted to insert a record which already exists. All changes have been rolled back.' AS msg;
     END;

     IF EXISTS(SELECT * FROM user_roles WHERE username = varUsername AND role = varRole)
		THEN
		SIGNAL SQLSTATE '23000';
	END IF;

  START TRANSACTION;
      INSERT INTO user_roles (username, role) VALUES (varUsername, varRole);
	COMMIT;
	SELECT "Transaction is committed" as FinalMessage;
END $$

DELIMITER ;
