USE cm6211_1819_team_5;

SET sql_safe_updates = 0;
DELETE FROM swipes;

ALTER TABLE swipes ADD PRIMARY KEY (username, scan_id);