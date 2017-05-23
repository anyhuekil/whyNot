/*
	README
	- 아래의 쿼리는 순서대로 실행 해야한다.(시퀀스생성 -> 테이블 생성)
	- 특정 쿼리만 실행시킬려고 할 때는 범위를 지정한 다음 (실행버튼 클릭  또는 Ctrl+Enter) 입력 
	- 시퀀스나 테이블을 생성할 때 앞에 붙는 whyNot는 계정 이름으로 만약 계정이 "SCOTT"이라면 "SCOTT"으로 바꿔준다.
	- 데이터 입력,수정(INSERT, UPDATE)은 참고용으로만 사용할 것을 추천한다.
	- 기타 문의는 작성자에게 문의하세요.
*/


/* 시퀀스 - AUCTION_USER */

CREATE SEQUENCE whyNot."AUCTION_USER_SEQ" MINVALUE 1
                                          MAXVALUE 1000
                                          INCREMENT BY 1
                                          START WITH 4
                                          NOCACHE
                                          NOORDER
                                          NOCYCLE;

/* 시퀀스 - AUCTION_ITEM */

CREATE SEQUENCE whyNot."AUCTION_ITEM_SEQ" MINVALUE 1
                                          MAXVALUE 1000
                                          INCREMENT BY 1
                                          START WITH 2
                                          NOCACHE
                                          NOORDER
                                          NOCYCLE;

/* 테이블 - AUCTION_USER */

CREATE TABLE whyNot."AUCTION_USER"
(
   "USER_ID"         NUMBER (10, 0),
   "USER_NAME"       VARCHAR2 (20 BYTE),
   "EMAIL"           VARCHAR2 (40 BYTE),
   "PASSWORD"        VARCHAR2 (20 BYTE),
   "REGISTER_DATE"   DATE,
   "AUTH"            NUMBER (1, 0) DEFAULT 1,
   PRIMARY KEY ("USER_ID")
      USING INDEX
         PCTFREE 10
         INITRANS 2
         MAXTRANS 255
         COMPUTE STATISTICS
         STORAGE (INITIAL 65536
                  NEXT 1048576
                  MINEXTENTS 1
                  MAXEXTENTS 2147483645
                  PCTINCREASE 0
                  FREELISTS 1
                  FREELIST GROUPS 1
                  BUFFER_POOL DEFAULT
                  FLASH_CACHE DEFAULT
                  CELL_FLASH_CACHE DEFAULT)
         TABLESPACE "USERS"
      ENABLE
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255
NOCOMPRESS
LOGGING
STORAGE (INITIAL 65536
         NEXT 1048576
         MINEXTENTS 1
         MAXEXTENTS 2147483645
         PCTINCREASE 0
         FREELISTS 1
         FREELIST GROUPS 1
         BUFFER_POOL DEFAULT
         FLASH_CACHE DEFAULT
         CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS";


CREATE OR REPLACE TRIGGER whyNot."TG_AUCTION_USER"
   BEFORE INSERT
   ON whyNot."AUCTION_USER"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."USER_ID" IS NULL
      THEN
         SELECT AUCTION_USER_SEQ.NEXTVAL INTO :NEW."USER_ID" FROM DUAL;
      END IF;
   END IF;
END;
/

ALTER TRIGGER whyNot."TG_AUCTION_USER" ENABLE;

/* 테이블 - AUCTIONEER_INFO */

CREATE TABLE whyNot."AUCTIONEER_INFO"
(
   "AUCTIONEER_ID"   NUMBER (10, 0),
   "LEVEL"           NUMBER (1, 0) DEFAULT 1,
   "SATISFACTION"    NUMBER (3, 0) DEFAULT 0,
   PRIMARY KEY ("AUCTIONEER_ID")
      USING INDEX
         PCTFREE 10
         INITRANS 2
         MAXTRANS 255
         COMPUTE STATISTICS
         STORAGE (INITIAL 65536
                  NEXT 1048576
                  MINEXTENTS 1
                  MAXEXTENTS 2147483645
                  PCTINCREASE 0
                  FREELISTS 1
                  FREELIST GROUPS 1
                  BUFFER_POOL DEFAULT
                  FLASH_CACHE DEFAULT
                  CELL_FLASH_CACHE DEFAULT)
         TABLESPACE "USERS"
      ENABLE,
   CONSTRAINT "FK_AUCTION_USER" FOREIGN KEY ("AUCTIONEER_ID")
   REFERENCES whyNot."AUCTION_USER" ("USER_ID")
   ENABLE
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255
NOCOMPRESS
LOGGING
STORAGE (INITIAL 65536
         NEXT 1048576
         MINEXTENTS 1
         MAXEXTENTS 2147483645
         PCTINCREASE 0
         FREELISTS 1
         FREELIST GROUPS 1
         BUFFER_POOL DEFAULT
         FLASH_CACHE DEFAULT
         CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS";



CREATE TABLE whyNot."AUCTION_ITEM"
(
   "AUCTIONEER_ID"        NUMBER (10, 0),
   "AUCTION_ID"           NUMBER (10, 0),
   "ITEM_NAME"            VARCHAR2 (20 BYTE),
   "START_DATE"           DATE,
   "END_DATE"             DATE,
   "STATE"                NUMBER (1, 0) DEFAULT 1,
   "CURRENT_BID_AMOUNT"   NUMBER (10, 0),
   CONSTRAINT "PK_AUCTION_ID" PRIMARY KEY ("AUCTION_ID")
   USING INDEX
      PCTFREE 10
      INITRANS 2
      MAXTRANS 255
      COMPUTE STATISTICS
      STORAGE (INITIAL 65536
               NEXT 1048576
               MINEXTENTS 1
               MAXEXTENTS 2147483645
               PCTINCREASE 0
               FREELISTS 1
               FREELIST GROUPS 1
               BUFFER_POOL DEFAULT
               FLASH_CACHE DEFAULT
               CELL_FLASH_CACHE DEFAULT)
      TABLESPACE "USERS"
   ENABLE,
   CONSTRAINT "FK_AUCTIONEER_ID" FOREIGN KEY ("AUCTIONEER_ID")
   REFERENCES whyNot."AUCTION_USER" ("USER_ID")
   ENABLE
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255
NOCOMPRESS
LOGGING
STORAGE (INITIAL 65536
         NEXT 1048576
         MINEXTENTS 1
         MAXEXTENTS 2147483645
         PCTINCREASE 0
         FREELISTS 1
         FREELIST GROUPS 1
         BUFFER_POOL DEFAULT
         FLASH_CACHE DEFAULT
         CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS";

 /* 테이블 - AUCTION_ITEM */

CREATE OR REPLACE TRIGGER whyNot."TG_AUCTION_ITEM"
   BEFORE INSERT
   ON whyNot."AUCTION_ITEM"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."AUCTION_ID" IS NULL
      THEN
         SELECT AUCTION_ITEM_SEQ.NEXTVAL INTO :NEW."AUCTION_ID" FROM DUAL;
      END IF;
   END IF;
END;
/

ALTER TRIGGER whyNot."TG_AUCTION_ITEM" ENABLE;

/* 테이블 - AUCTION_BID */

CREATE TABLE whyNot."AUCTION_BID"
(
   "BIDDER_ID"      NUMBER (10, 0),
   "AUCTION_ID"     NUMBER (10, 0),
   "BIDDING_DATE"   DATE,
   "BID_AMOUNT"     NUMBER (10, 0),
   PRIMARY KEY ("AUCTION_ID", "BIDDER_ID", "BIDDING_DATE")
      USING INDEX
         PCTFREE 10
         INITRANS 2
         MAXTRANS 255
         COMPUTE STATISTICS
         STORAGE (INITIAL 65536
                  NEXT 1048576
                  MINEXTENTS 1
                  MAXEXTENTS 2147483645
                  PCTINCREASE 0
                  FREELISTS 1
                  FREELIST GROUPS 1
                  BUFFER_POOL DEFAULT
                  FLASH_CACHE DEFAULT
                  CELL_FLASH_CACHE DEFAULT)
         TABLESPACE "USERS"
      ENABLE,
   CONSTRAINT "FK_BIDDER_ID" FOREIGN KEY ("BIDDER_ID")
   REFERENCES whyNot."AUCTION_USER" ("USER_ID")
   ENABLE,
   CONSTRAINT "FK_AUCTION_ID" FOREIGN KEY ("AUCTION_ID")
   REFERENCES whyNot."AUCTION_ITEM" ("AUCTION_ID")
   ENABLE
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10
PCTUSED 40
INITRANS 1
MAXTRANS 255
NOCOMPRESS
LOGGING
STORAGE (INITIAL 65536
         NEXT 1048576
         MINEXTENTS 1
         MAXEXTENTS 2147483645
         PCTINCREASE 0
         FREELISTS 1
         FREELIST GROUPS 1
         BUFFER_POOL DEFAULT
         FLASH_CACHE DEFAULT
         CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS";

/* 더미데이터 생성 쿼리 */


/* 계정 생성 */

INSERT INTO auction_user (USER_NAME,
                          PASSWORD,
                          EMAIL,
                          REGISTER_DATE)
     VALUES ('admin',
             '1111',
             'admin@test.com',
             SYSDATE);

INSERT INTO auction_user (USER_NAME,
                          PASSWORD,
                          EMAIL,
                          REGISTER_DATE)
     VALUES ('user01',
             '1111',
             'user01@test.com',
             SYSDATE);

INSERT INTO auction_user (USER_NAME,
                          PASSWORD,
                          EMAIL,
                          REGISTER_DATE)
     VALUES ('user02',
             '1111',
             'user02@test.com',
             SYSDATE);



/* 판매자 등록 */

INSERT INTO auctioneer_info (AUCTIONEER_ID)
     VALUES (4);

INSERT INTO auctioneer_info (AUCTIONEER_ID)
     VALUES (5);

INSERT INTO auctioneer_info (AUCTIONEER_ID)
     VALUES (6);



/* 경매 물풀 등록 */

INSERT INTO auction_ITEM (AUCTIONEER_ID,
                          ITEM_NAME,
                          START_DATE,
                          END_DATE,
                          CURRENT_BID_AMOUNT)
     VALUES (6,
             'LOTTO',
             SYSDATE,
             SYSDATE + 7,
             1000);

/* 입찰시 경매 물품의 현재 가격을 갱신함(이래 입찰 쿼리와 같이 이루어져야함) */

UPDATE auction_item
   SET current_bid_amount = 1100
 WHERE auction_id = 3;

UPDATE auction_item
   SET current_bid_amount = 1200
 WHERE auction_id = 3;

UPDATE auction_item
   SET current_bid_amount = 1300
 WHERE auction_id = 3;

SELECT * FROM AUCTION_USER;

SELECT * FROM AUCTIONEER_INFO;

SELECT * FROM AUCTION_ITEM;

SELECT * FROM AUCTION_BID;

/* 입찰자가 차례로 입찰 */

INSERT INTO auction_bid (BIDDER_ID,
                         AUCTION_ID,
                         BIDDING_DATE,
                         BID_AMOUNT)
     VALUES (4,
             3,
             SYSDATE,
             1100);

INSERT INTO auction_bid (BIDDER_ID,
                         AUCTION_ID,
                         BIDDING_DATE,
                         BID_AMOUNT)
     VALUES (5,
             3,
             SYSDATE,
             1200);

INSERT INTO auction_bid (BIDDER_ID,
                         AUCTION_ID,
                         BIDDING_DATE,
                         BID_AMOUNT)
     VALUES (6,
             3,
             SYSDATE,
             1300);