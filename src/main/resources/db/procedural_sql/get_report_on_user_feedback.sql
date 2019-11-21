DROP PROCEDURE IF EXISTS getFeedbackReport;

DELIMITER ;;

CREATE PROCEDURE getFeedbackReport(OUT enjoyed1 INT, OUT enjoyed2 INT, OUT enjoyed3 INT, OUT enjoyed4 INT, OUT enjoyed5 INT,
OUT difficult1 INT, OUT difficult2 INT, OUT difficult3 INT, OUT difficult4 INT, OUT difficult5 INT,
OUT recommend1 INT, OUT recommend2 INT, OUT recommend3 INT, OUT recommend4 INT, OUT recommend5 INT)
BEGIN


SELECT COUNT(enjoyed) AS 'Number of People' FROM feedback where enjoyed = 1 INTO enjoyed1;
SELECT COUNT(enjoyed) FROM feedback where enjoyed = 2 INTO enjoyed2;
SELECT COUNT(enjoyed) FROM feedback where enjoyed = 3 INTO  enjoyed3;
SELECT COUNT(enjoyed) FROM feedback WHERE enjoyed = 4 INTO enjoyed4;
SELECT COUNT(enjoyed) FROM feedback WHERE enjoyed = 5 INTO enjoyed5;


SELECT COUNT(task_right_level) AS 'Number of People' FROM  feedback where task_right_level = 1 INTO difficult1;
SELECT COUNT(task_right_level) FROM feedback where task_right_level = 2 INTO difficult2;
SELECT COUNT(task_right_level) FROM feedback where task_right_level = 3 INTO  difficult3;
SELECT COUNT(task_right_level) FROM feedback WHERE task_right_level = 4 INTO difficult4;
SELECT COUNT(task_right_level) FROM feedback WHERE task_right_level = 5 INTO difficult5;


SELECT COUNT(recommend) AS 'Number of People' FROM  feedback where recommend = 1 INTO recommend1;
SELECT COUNT(recommend) FROM feedback where recommend = 2 INTO recommend2;
SELECT COUNT(recommend) FROM feedback where recommend = 3 INTO recommend3;
SELECT COUNT(recommend) FROM feedback WHERE recommend = 4 INTO recommend4;
SELECT COUNT(recommend) FROM feedback WHERE recommend = 5 INTO recommend5;

END ;;

DELIMITER  ;

