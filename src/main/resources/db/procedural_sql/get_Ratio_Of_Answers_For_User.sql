
DROP FUNCTION IF EXISTS calculateNumberOfCorrectSwipes;

DELIMITER $$

CREATE FUNCTION calculateNumberOfCorrectSwipes(varUsername VARCHAR(50))
RETURNS INTEGER
BEGIN

RETURN (SELECT COUNT(*) FROM swipes s inner join images i on i.image_uri=s.image_uri where i.correct_answer = s.is_good_scan and s.username=varUsername);

END $$
DELIMITER ;

DROP FUNCTION IF EXISTS calculateNumberOfIncorrectSwipes;

DELIMITER $$

CREATE FUNCTION calculateNumberOfIncorrectSwipes(varUsername VARCHAR(50))
RETURNS INTEGER
BEGIN

RETURN (SELECT COUNT(*) FROM swipes s inner join images i on i.image_uri=s.image_uri where i.correct_answer != s.is_good_scan and s.username=varUsername);

END $$
DELIMITER ;

DROP FUNCTION IF EXISTS calculatePercentage;

DELIMITER $$

CREATE FUNCTION calculatePercentage(a INT, b INT)
RETURNS DOUBLE
BEGIN

RETURN ROUND(((a / b) * 100 ));

END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS answersRatio;

DELIMITER $$

CREATE PROCEDURE answersRatio(OUT percentageOfCorrectAnswers DOUBLE, OUT percentageOfIncorrectAnswers DOUBLE)
BEGIN

DECLARE finished INTEGER DEFAULT 0;
DECLARE numOfCorrectAnswers INTEGER;
DECLARE numOfIncorrectAnswers INTEGER;
DECLARE varUsername VARCHAR(50);
DECLARE numOfSwipes INTEGER;


 DEClARE users_cursor CURSOR FOR
 SELECT username FROM users;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN users_cursor;

SET numOfCorrectAnswers = 0;
SET numOfIncorrectAnswers = 0;

		 get_users_loop: LOOP

				 FETCH users_cursor INTO varUsername;

				 IF finished = 1 THEN
				   LEAVE get_users_loop;
				 END IF;

                 SET numOfCorrectAnswers = numOfCorrectAnswers + calculateNumberOfCorrectSwipes(varUsername);
                 SET numOfIncorrectAnswers = numOfIncorrectAnswers + calculateNumberOfIncorrectSwipes(varUsername);

		 END LOOP get_users_loop;
     SET numOfSwipes = numOfCorrectAnswers + numOfIncorrectAnswers;

     SELECT calculatePercentage(numOfCorrectAnswers, numOfSwipes)  INTO percentageOfCorrectAnswers;
     SELECT calculatePercentage(numOfIncorrectAnswers, numOfSwipes) INTO percentageOfIncorrectAnswers;

 CLOSE users_cursor; -- close the cursor

 END $$
 DELIMITER ;