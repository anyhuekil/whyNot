CREATE TABLE TESTQUIZ
(
   NO     NUMBER,
   QUIZ   VARCHAR2 (500),
   ANS    VARCHAR2 (100)
)
NOCACHE
LOGGING;

INSERT INTO TESTQUIZ (NO, QUIZ, ANS)
        VALUES (
                  7789,
                  '東海물과 白頭山이 마르고 닳도록 하느님이 保佑하사 우리나라 萬歲. 無窮花 三千里 華麗江山 大韓 사람, 大韓으로 길이 保全하세.',
                  '애국가');

INSERT INTO TESTQUIZ (NO, QUIZ, ANS)
        VALUES (
                  8001,
                  '東海물과 白頭山이 마르고 닳도록\n하느님이 保佑하사 우리나라 萬歲.\n無窮花 三千里 華麗江山\n大韓 사람, 大韓으로 길이 保全하세.',
                  '애국가1절');

INSERT INTO TESTQUIZ (NO, QUIZ, ANS)
        VALUES (
                  8002,
                  '南山[11] 위에 저 소나무, 鐵甲을 두른 듯\n바람서리[12] 不變함은 우리 氣像일세.\n無窮花 三千里 華麗江山\n大韓 사람, 大韓으로 길이 保全하세.',
                  '애국가2절');

INSERT INTO TESTQUIZ (NO, QUIZ, ANS)
        VALUES (
                  8003,
                  '가을 하늘 空豁한데 높고 구름 없이\n밝은 달은 우리 가슴 一片丹心일세.\n無窮花 三千里 華麗江山\n大韓 사람, 大韓으로 길이 保全하세.',
                  '애국가3절');

INSERT INTO TESTQUIZ (NO, QUIZ, ANS)
        VALUES (
                  8004,
                  '이 氣像과 이 맘으로 忠誠을 다하여\n괴로우나 즐거우나 나라 사랑하세.\n無窮花 三千里 華麗江山\n大韓 사람, 大韓으로 길이 保全하세.',
                  '애국가4절');

COMMIT;