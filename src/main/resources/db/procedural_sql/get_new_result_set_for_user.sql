DROP PROCEDURE IF EXISTS getNewBatchForUser;

DELIMITER //

-- Takes the user_id  as an input parameter
CREATE PROCEDURE getNewBatchForUser(IN var_username VARCHAR(50))
BEGIN

SELECT * FROM (SELECT i.image_uri FROM images i
					WHERE i.correct_answer = 1 AND NOT EXISTS
						(SELECT s.image_uri, s.username FROM swipes s WHERE s.image_uri = i.image_uri AND s.username = var_username)
							LIMIT 9) AS good_images
                            UNION SELECT
								(SELECT i.image_uri FROM images i WHERE i.correct_answer = 0 AND NOT EXISTS
									(SELECT s.image_uri, s.username FROM swipes s WHERE s.image_uri = i.image_uri AND s.username = var_username)
										LIMIT 1) as bad_image;

END//

DELIMITER ;


-- OLD VERSION BELOW
--
--  -- Stored procedure to fetch a new batch of images the user hasn't yet swiped on
-- DROP PROCEDURE IF EXISTS getNewBatchForUser;
--
-- DELIMITER //
--
-- -- Takes the user_id  as an input parameter
-- CREATE PROCEDURE getNewBatchForUser(IN var_user_id INTEGER)
-- BEGIN
--
-- DECLARE finished INTEGER DEFAULT 0; -- variable that will allow us to exit the loop and handle
-- 									-- set not found
--
-- DECLARE variable_batch_ID INTEGER; -- variable to hold the current batch ID
--
--  DEClARE batch_cursor CURSOR FOR
--  SELECT batch_ID FROM batch_data; -- Cursor to select batch_id into variable_batch_ID
--
--
-- DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1; -- Indicates if we can exit the loop
--
-- OPEN batch_cursor;
--
-- 		 get_batch_ID_loop: LOOP -- Start loop
--
-- 				 FETCH batch_cursor INTO variable_batch_ID;
--
--                  -- Find the first batch a user is yet to swipe on, if any
--                  IF NOT EXISTS (SELECT s.image_uri FROM swipes s
-- 									                INNER JOIN images i ON i.image_uri = s.image_uri
-- 										                WHERE user_id = var_user_id AND i.batch_number = variable_batch_id)
--                  THEN
--                      SELECT i.image_uri, i.batch_number FROM images i WHERE batch_number = variable_batch_id; -- return the batch
-- 					           LEAVE get_batch_ID_loop;
--                  END IF;
--
-- 				  IF finished = 1 -- If a user has swiped all batches, then return null
--                   THEN
-- 					            SELECT NULL;
-- 				              LEAVE get_batch_ID_loop;
-- 				  END IF;
--
-- 		 END LOOP get_batch_ID_loop;
--
--  CLOSE batch_cursor;
--
-- END//
--
-- DELIMITER ;































