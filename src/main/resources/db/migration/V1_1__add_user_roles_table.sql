USE cm6211_1819_team_5;

DROP TABLE IF EXISTS user_roles;

CREATE TABLE user_roles
(
user_role_id INTEGER(11) AUTO_INCREMENT,
  username VARCHAR(50),
  role VARCHAR(45),
  PRIMARY KEY (user_role_id),
  FOREIGN KEY (username) REFERENCES users (username)
);

INSERT INTO user_roles (username, role) VALUES ('loz', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('loz', 'ROLE_USER');

INSERT INTO user_roles (username, role) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('admin', 'ROLE_USER');

INSERT INTO user_roles (username, role) VALUES ('bazza', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('bazza', 'ROLE_USER');