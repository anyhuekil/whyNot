CREATE TABLE ACCESSUSER(
	userNo NUMBER PRIMARY KEY,
	ip VARCHAR2(50),
	grade VARCHAR2(50),
	name VARCHAR2(50),
	nameSign NUMBER,
	starBalloon NUMBER,
	nameCode NUMBER
)
NOCACHE
LOGGING;

select * from product;



CREATE TABLE PRODUCT
(
   PROD    VARCHAR2 (500),
   COUNT   NUMBER
)
NOCACHE
LOGGING;

insert into PRODUCT values('돌맹이' , 10);