CREATE TABLE Vision
(
   name   VARCHAR2 (50),
   dtno   NUMBER PRIMARY KEY
);

INSERT INTO Vision
     VALUES ('돌맹이', 007);
INSERT INTO Vision
     VALUES ('whyNot', 12);

COMMIT;

SELECT * FROM vision;