USE cm6211_1819_team_5;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM user_equality;

ALTER TABLE user_equality ADD UNIQUE (username);