USE cm6211_1819_team_5;

DROP PROCEDURE IF EXISTS getTrainingBatch;
DELIMITER //

-- Takes the user_id  as an input parameter
-- Returns a result set of scans the user hasn't swiped on yet weighted with bad images
CREATE PROCEDURE getTrainingBatch(IN var_username VARCHAR(50))
BEGIN
(SELECT sc.scan_id, sc.correct_answer FROM scans sc
  WHERE sc.scan_id LIKE '4404%' OR sc.scan_id LIKE '4537%' OR sc.scan_id LIKE '6979%' OR sc.scan_id LIKE '2352%'
  OR sc.scan_id LIKE '823%' OR sc.scan_id LIKE '1072%' OR sc.scan_id LIKE '2047%' OR sc.scan_id LIKE '1495%' OR sc.scan_id LIKE '2411%'
  OR sc.scan_id LIKE '988%' OR sc.scan_id LIKE '10014%' OR sc.scan_id LIKE '10046%' OR sc.scan_id LIKE '10235%'
  OR sc.scan_id LIKE '10376%' OR sc.scan_id LIKE '10316%' OR sc.scan_id LIKE '1795%' OR sc.scan_id LIKE '2338%'
  OR sc.scan_id LIKE '10297%' OR sc.scan_id LIKE '10303%');

END//

DELIMITER ;

USE cm6211_1819_team_5;
DROP TABLE IF EXISTS training_swipes;
CREATE TABLE training_swipes
(
	username VARCHAR(50) NOT NULL,
    scan_id VARCHAR(100) NOT NULL,
    is_good_scan TINYINT(1),
    FOREIGN KEY (username) REFERENCES users(username),
    FOREIGN KEY (scan_id) REFERENCES scans (scan_id)
);