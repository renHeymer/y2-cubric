USE CM621_1819_TEAM_5;

DROP PROCEDURE IF EXISTS userAnswerScores;

DELIMITER //

CREATE PROCEDURE userAnswerScores(IN varUsername VARCHAR(50),
                                  OUT numOfCorrectScans INTEGER,
                                  OUT numOfIncorrectScans INTEGER,
                                  OUT percentageOfCorrectScans DOUBLE)
BEGIN

SELECT COUNT(*) FROM swipes s INNER JOIN images i ON i.image_uri=s.image_uri
       WHERE i.correct_answer = s.is_good_scan  AND s.username=varUsername INTO numOfCorrectScans;

SELECT COUNT(*) FROM swipes s INNER JOIN images i ON i.image_uri=s.image_uri
        WHERE i.correct_answer != s.is_good_scan AND s.username=varUsername INTO numOfIncorrectScans;

SELECT (numOfCorrectScans / (numOfCorrectScans + numOfIncorrectScans)) * 100 INTO percentageOfCorrectScans;

END//

DELIMITER ;


/*
-----------------------
STORED PROCEDURE IDEAS
-----------------------
1. Give overview of which users are getting it and which aren't

2. Give overview of feedback

3. How many people get past training, how much time they spend on training

4. Stored procedure to recreate materialised view?
 */



