USE cm6211_1819_team_5;

INSERT INTO swipes VALUES ('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg', 'loz', 1, NOW());
INSERT INTO swipes VALUES ('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg', 'Holly', 1, NOW());
INSERT INTO swipes VALUES ('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg', 'Hristo', 1, NOW());
INSERT INTO swipes VALUES ('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg', 'admin', 0, NOW());
INSERT INTO swipes VALUES ('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg', 'Arron', 0, NOW());
INSERT INTO swipes VALUES ('10014A_split_MD_C_trafo_tracts_dRL_FOD_interp_FORNIX.jpg', 'dan', 1, NOW());

DELETE FROM user_roles WHERE username = 'loz';
DELETE FROM users WHERE username = 'loz';
INSERT INTO users VALUES ('loz','$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS',1,'loz@gmail.com',1,0,NULL,NULL, '$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS');
INSERT INTO user_roles (username, role) VALUES ('loz', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('loz', 'ROLE_USER');

DELETE FROM user_roles WHERE username = 'admin';
DELETE FROM users WHERE username = 'admin';
INSERT INTO users VALUES ('admin','$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS',1,'admin@gmail.com',1,0,NULL,NULL, '$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS');
INSERT INTO user_roles (username, role) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('admin', 'ROLE_USER');

INSERT INTO users VALUES ('user','$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS',1,'user@gmail.com',1,0,NULL,NULL, '$2a$10$s7SAMDy9uDpAK4j0PqSUBexmpiJwkhE8PDHTLvboHx9L1UdSo.6BS');
INSERT INTO user_roles (username, role) VALUES ('user', 'ROLE_USER');







