USE cm6211_1819_team_5;

DROP PROCEDURE IF EXISTS updateDiscountedUsersLive;

DELIMITER ;;
CREATE PROCEDURE updateDiscountedUsersLive(OUT totalActiveUsers INTEGER, OUT totalOutliers INTEGER)
BEGIN

DECLARE finished INTEGER DEFAULT 0;
DECLARE numberSayGood INTEGER;
DECLARE numberSayBad INTEGER;
DECLARE userAnswer INTEGER;
DECLARE percentageMajoritySayCorrect DOUBLE;
DECLARE numUserHasGottenCorrect INTEGER;
DECLARE totalSwipesForUser INTEGER;
DECLARE percentageUserHasCorrect DOUBLE;
DECLARE varUsername VARCHAR(50);
DECLARE numOfUserSwipesSoFar INTEGER;
DECLARE varScanId VARCHAR(100);
-- Constants
DECLARE MIN_ROWS_NEEDED INTEGER;
DECLARE MIN_CORRECT_ANSWERS DOUBLE;


 DECLARE users_cursor CURSOR FOR
 SELECT u.username FROM users u WHERE u.username IN (SELECT username FROM swipes s GROUP BY s.username HAVING COUNT(s.username) > 20);

 DECLARE scan_cursor CURSOR FOR
 SELECT scan_id FROM userconfidence;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN users_cursor;

		 get_users_loop: LOOP

				 FETCH users_cursor INTO varUsername;
                  -- Set it to 0 for each user
				 SET numUserHasGottenCorrect = 0;
				 SET totalSwipesForUser = 0;

				 IF finished = 1 THEN
				   LEAVE get_users_loop;
				 END IF;

                 OPEN scan_cursor;

					 get_decided_scans_loop: LOOP

					 FETCH scan_cursor INTO varScanId;

                      IF finished = 1 THEN
						LEAVE get_decided_scans_loop;
                        SET finished = 0;
					  END IF;

                     SELECT answerGood FROM userconfidence WHERE scan_id = varScanId INTO numberSayGood;
					 SELECT answerBad FROM userconfidence WHERE scan_id = varScanId INTO numberSayBad;
                     SET percentageMajoritySayCorrect = calculatePercentage(numberSayGood, (numberSayGood + numberSayBad));
                     SELECT is_good_scan FROM swipes WHERE username = varUsername AND scan_id = varScanId INTO userAnswer;
                     SET totalSwipesForUser = totalSwipesForUser + 1;
                         IF (percentageMajoritySayCorrect >= 80 && userAnswer = 1)
							THEN
								SET numUserHasGottenCorrect = numUserHasGottenCorrect + 1;
						END IF;
                        IF (percentageMajoritySayCorrect < 40 && userAnswer = 0)
							THEN
								SET numUserHasGottenCorrect = numUserHasGottenCorrect + 1;
						END IF;

					END LOOP get_decided_scans_loop;
                    CLOSE scan_cursor;

					IF ((numUserHasGottenCorrect / totalSwipesForUser) * 100 < 70)
                    THEN
                    UPDATE `cm6211_1819_team_5`.`users` SET discounted = 1 WHERE username = varUsername;
                    END IF;


		 END LOOP get_users_loop;

 CLOSE users_cursor; -- close the cursor

 SELECT COUNT(username) FROM users WHERE discounted = 1 INTO totalOutliers;
 SELECT COUNT(*) FROM users INTO totalActiveUsers;
END ;;
DELIMITER ;