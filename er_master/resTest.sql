SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Shop;
DROP TABLE IF EXISTS Hall;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS MenuCategory;




/* Create Tables */

CREATE TABLE Hall
(
	-- 식탁식별번호
	hallNo int unsigned NOT NULL AUTO_INCREMENT COMMENT '식탁식별번호',
	-- 테이블번호
	-- 
	tableNum int unsigned NOT NULL COMMENT '테이블번호
',
	-- 좌석수
	seatCnt int unsigned NOT NULL COMMENT '좌석수',
	-- 식당 상태 
	hallStatus int NOT NULL COMMENT '식당 상태 ',
	PRIMARY KEY (hallNo),
	UNIQUE (hallNo)
);


CREATE TABLE Menu
(
	-- 메뉴식별번호
	menuNo int unsigned NOT NULL AUTO_INCREMENT COMMENT '메뉴식별번호',
	-- 메뉴명
	menuName varchar(50) NOT NULL COMMENT '메뉴명',
	-- 메뉴가격
	-- 
	menuPrice int unsigned NOT NULL COMMENT '메뉴가격
',
	-- 메뉴분류식별키
	menuCaNo int unsigned NOT NULL COMMENT '메뉴분류식별키',
	PRIMARY KEY (menuNo),
	UNIQUE (menuNo),
	UNIQUE (menuCaNo)
);


CREATE TABLE MenuCategory
(
	-- 메뉴분류식별키
	menuCaNo int unsigned NOT NULL AUTO_INCREMENT COMMENT '메뉴분류식별키',
	-- 메뉴분류이름
	menuCaName varchar(50) NOT NULL COMMENT '메뉴분류이름',
	PRIMARY KEY (menuCaNo),
	UNIQUE (menuCaNo),
	UNIQUE (menuCaName)
);


CREATE TABLE Reservation
(
	-- 예약고유식별번호
	resNo int unsigned NOT NULL AUTO_INCREMENT COMMENT '예약고유식별번호',
	-- 식당식별번호
	shopNo int unsigned NOT NULL COMMENT '식당식별번호',
	PRIMARY KEY (resNo),
	UNIQUE (resNo),
	UNIQUE (shopNo)
);


CREATE TABLE Shop
(
	-- 식당식별번호
	shopNo int unsigned NOT NULL AUTO_INCREMENT COMMENT '식당식별번호',
	-- 상호명
	shopName varchar(50) NOT NULL COMMENT '상호명',
	-- 식당주소
	shopAddress varchar(70) NOT NULL COMMENT '식당주소',
	-- 식당연락처
	shopHP int NOT NULL COMMENT '식당연락처',
	-- 영업시간
	shopTime varchar(70) NOT NULL COMMENT '영업시간',
	-- 식탁식별번호
	hallNo int unsigned NOT NULL COMMENT '식탁식별번호',
	-- 메뉴식별번호
	menuNo int unsigned NOT NULL COMMENT '메뉴식별번호',
	PRIMARY KEY (shopNo),
	UNIQUE (shopNo),
	UNIQUE (shopHP),
	UNIQUE (hallNo),
	UNIQUE (menuNo)
);


CREATE TABLE User
(
	-- 유저 식별 번호
	userNo int unsigned NOT NULL AUTO_INCREMENT COMMENT '유저 식별 번호',
	-- 사용자이름
	userName varchar(50) NOT NULL COMMENT '사용자이름',
	-- 사용자아이디
	userId varchar(30) NOT NULL COMMENT '사용자아이디',
	-- 사용자번호
	userPwd varchar(50) NOT NULL COMMENT '사용자번호',
	-- 사용자 폰번호
	userHP int unsigned NOT NULL COMMENT '사용자 폰번호',
	-- 유저종류식별번호
	admin int NOT NULL COMMENT '유저종류식별번호',
	-- 예약고유식별번호
	resNo int unsigned NOT NULL COMMENT '예약고유식별번호',
	PRIMARY KEY (userNo),
	UNIQUE (userNo),
	UNIQUE (userId),
	UNIQUE (userHP),
	UNIQUE (resNo)
);



/* Create Foreign Keys */

ALTER TABLE Shop
	ADD FOREIGN KEY (hallNo)
	REFERENCES Hall (hallNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Shop
	ADD FOREIGN KEY (menuNo)
	REFERENCES Menu (menuNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Menu
	ADD FOREIGN KEY (menuCaNo)
	REFERENCES MenuCategory (menuCaNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE User
	ADD FOREIGN KEY (resNo)
	REFERENCES Reservation (resNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Reservation
	ADD FOREIGN KEY (shopNo)
	REFERENCES Shop (shopNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



