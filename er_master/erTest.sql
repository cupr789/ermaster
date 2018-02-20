SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS connection_info;
DROP TABLE IF EXISTS user_info;




/* Create Tables */

CREATE TABLE connection_info
(
	ciNo int unsigned NOT NULL AUTO_INCREMENT,
	ciName varchar(200) NOT NULL,
	ciUrl varchar(300) NOT NULL,
	ciPort smallint(6) NOT NULL,
	ciDatabase varchar(300) NOT NULL,
	ciUser varchar(100) NOT NULL,
	ciPwd varchar(100) NOT NULL,
	ciEtc varchar(2000),
	uiId varchar(300) NOT NULL,
	PRIMARY KEY (ciNo),
	UNIQUE (uiId)
);


CREATE TABLE user_info
(
	uiNo int unsigned NOT NULL,
	uiName varchar(300) NOT NULL,
	uiId varchar(300) NOT NULL,
	uiPwd varchar(300) NOT NULL,
	uiEmail varchar(400) NOT NULL,
	PRIMARY KEY (uiNo),
	UNIQUE (uiId),
	UNIQUE (uiId)
);



/* Create Foreign Keys */

ALTER TABLE connection_info
	ADD FOREIGN KEY (uiId)
	REFERENCES user_info (uiId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



