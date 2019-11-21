USE cm6211_1819_team_5;

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

RETURN ((a / b) * 100 );

END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS updateDiscountedUsers;

DELIMITER $$

CREATE PROCEDURE updateDiscountedUsers()
BEGIN

DECLARE finished INTEGER DEFAULT 0;
DECLARE numOfCorrectAnswers INTEGER;
DECLARE numOfIncorrectAnswers INTEGER;
DECLARE percentageOfCorrectAnswers INTEGER;
DECLARE varUsername VARCHAR(50);
DECLARE numOfUserSwipesSoFar INTEGER;
-- Constants
DECLARE MIN_ROWS_NEEDED INTEGER;
DECLARE MIN_CORRECT_ANSWERS DOUBLE;


 DEClARE users_cursor CURSOR FOR
 SELECT username FROM users;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN users_cursor;

         SET MIN_ROWS_NEEDED = 20;
         SET MIN_CORRECT_ANSWERS = 70;

		 get_users_loop: LOOP

				 FETCH users_cursor INTO varUsername;

				 IF finished = 1 THEN
				   LEAVE get_users_loop;
				 END IF;

                 SELECT calculateNumberOfIncorrectSwipes(varUsername) INTO numOfIncorrectAnswers;
                 SELECT calculateNumberOfCorrectSwipes(varUsername) INTO numOfCorrectAnswers;
                 SET numOfUserSwipesSoFar = numOfCorrectAnswers + numOfIncorrectAnswers;

                 IF (numOfUserSwipesSoFar >= MIN_ROWS_NEEDED = 1)
					THEN
						SELECT calculatePercentage(numOfCorrectAnswers, numOfUserSwipesSoFar) INTO percentageOfCorrectAnswers;
						IF(percentageOfCorrectAnswers < MIN_CORRECT_ANSWERS = 1)
							THEN
								UPDATE `cm6211_1819_team_5`.`users` SET discounted = 1 WHERE username = varUsername;
						END IF;
				END IF;

		 END LOOP get_users_loop;

 CLOSE users_cursor; -- close the cursor

END $$

DELIMITER ;



