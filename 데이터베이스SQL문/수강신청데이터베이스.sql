--캠퍼스테이블생성
--------------------------------------------------------
--  DDL for Table CAMPUS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CAMPUS" 
   (	"ID" VARCHAR2(5 BYTE), 
	"NAME" VARCHAR2(15 BYTE), 
	"FILENAME" VARCHAR2(15 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.CAMPUS
SET DEFINE OFF;
Insert into SYSTEM.CAMPUS (ID,NAME,FILENAME) values ('1','용인','yongin');
Insert into SYSTEM.CAMPUS (ID,NAME,FILENAME) values ('2','서울','seoul');
--------------------------------------------------------
--  DDL for Index SYS_C007134
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007134" ON "SYSTEM"."CAMPUS" ("FILENAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table CAMPUS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CAMPUS" ADD PRIMARY KEY ("FILENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."CAMPUS" MODIFY ("FILENAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CAMPUS" MODIFY ("NAME" NOT NULL ENABLE);
  
  --대학테이블생성
--------------------------------------------------------
--  DDL for Table COLLEGE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."COLLEGE" 
   (	"ID" VARCHAR2(5 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"FILENAME" VARCHAR2(30 BYTE), 
	"CAMPUS" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.COLLEGE
SET DEFINE OFF;
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('10','교양','generalY','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('11','공과대학','engineering','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('12','자연과학대학','science','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('13','예술체육대학','art','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('13','건축대학','architecture','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('20','교양','generalS','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('21','ICT융합대학','ict','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('22','경영대학','business','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('23','사회과학대학','social','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('24','인문대학','human','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('25','법학대학','law','seoul');
--------------------------------------------------------
--  DDL for Index SYS_C007138
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007138" ON "SYSTEM"."COLLEGE" ("FILENAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table COLLEGE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."COLLEGE" ADD PRIMARY KEY ("FILENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."COLLEGE" MODIFY ("CAMPUS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."COLLEGE" MODIFY ("FILENAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."COLLEGE" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table COLLEGE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."COLLEGE" ADD FOREIGN KEY ("CAMPUS")
	  REFERENCES "SYSTEM"."CAMPUS" ("FILENAME") ENABLE;

--학과테이블 생성
--------------------------------------------------------
--  DDL for Table HACKGWA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."HACKGWA" 
   (	"ID" VARCHAR2(5 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"FILENAME" VARCHAR2(30 BYTE), 
	"COLLEGE" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.HACKGWA
SET DEFINE OFF;
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('101','영어교양','englishYG','generalY');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('102','기초교양','basic','generalY');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('103','선택교양','selective','generalY');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('111','전기공학과','electricity','engineering');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('112','컴퓨터공학과','computer','engineering');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('120','수학과','math','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('121','물리학과','physics','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('122','화학과','chemistry','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('124','생명과학정보학과','life','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('123','식품영양학과','food','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('130','디자인학부','design','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('131','체육학부','physical','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('132','음악학부','music','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('133','바둑학과','baduk','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('134','영화/뮤지컬학부','musical','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('140','건축학부','architect','architecture');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('141','공간디자인전공','basicArchitecture','architecture');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('211','디지털콘텐츠','digitalContents','ict');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('212','융합소프트웨어','software','ict');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('220','경영학과','management','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('221','국제통상학과','internationalTrade','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('222','경영정보학과','managementInformation','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('223','부동산학과','property','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('224','경영교육혁신센터','managementEducation','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('201','영어교양','englishYGS','generalS');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('202','기초교양','basicS','generalS');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('203','선택교양','selectiveS','generalS');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('230','행정학과','administration','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('231','경제학과','economy','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('232','정치외교학과','politics','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('233','디지털미디어학과','children','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('235','청소년지도학과','teenager','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('236','사회복지학과','welfare','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('240','국어국문학과','korean','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('241','중어중문학과','chinese','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('242','일어일문학과','japanese','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('243','영어영문학과','english','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('244','사학과','history','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('245','문헌정보학과','library','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('246','미술사학과','artHistory','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('247','철학과','philosophy','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('248','아랍지역학과','arab','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('249','문예창작과','writing','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('250','법학과','lawC','law');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('251','법무정책학과','politicsL','law');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('233','디지털미디어학과','digitalMedia','social');
--------------------------------------------------------
--  DDL for Index SYS_C007146
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007146" ON "SYSTEM"."HACKGWA" ("FILENAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table HACKGWA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."HACKGWA" ADD PRIMARY KEY ("FILENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."HACKGWA" MODIFY ("COLLEGE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."HACKGWA" MODIFY ("FILENAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."HACKGWA" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table HACKGWA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."HACKGWA" ADD FOREIGN KEY ("COLLEGE")
	  REFERENCES "SYSTEM"."COLLEGE" ("FILENAME") ENABLE;

--강좌테이블 생성
--------------------------------------------------------
--  DDL for Table GANGJWA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."GANGJWA" 
   (	"ID" VARCHAR2(5 BYTE), 
	"NAME" VARCHAR2(50 BYTE), 
	"LECTURER" VARCHAR2(30 BYTE), 
	"CREDIT" VARCHAR2(30 BYTE), 
	"TIME" VARCHAR2(30 BYTE), 
	"HACKGWA" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.GANGJWA
SET DEFINE OFF;
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1010','영어1','여인욱','3','월수1030-1145','englishYG');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1011','영어회화1','다니엘','2','월수1030-1145','englishYG');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1020','글쓰기','육민수','3','월수1030-1145','basic');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1021','발표와토의','주민재','3','월수1030-1145','basic');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1030','한국근현대사의이해','윤홍석','3','월수1030-1145','selective');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1031','민주주의와현대사회','윤홍석','3','월수1030-1145','selective');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1110','전기전자1','김민수','3','월수0900-1015','electricity');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1111','전기전자2','김민수','3','월수1030-1145','electricity');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1210','C언어','전종훈','3','화목1800-1900','computer');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1211','시스템과프로그래밍','권동섭','4','목금1300-1400','computer');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1221','수학교재연구및지도법','박진형','2','화1300-1445','math');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1222','정수론','소순태','3','월1300-1345','math');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1223','해석학개론','홍덕현','3','월1400-1445','math');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1310','물리학','김주학','3','월1000-1145','physics');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1140','화학2','김선경','3','월수0900-1015','chemistry');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1230','식품학','황지영','3','월1300-1345','food');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1240','미생물학','이상희','4','월수1030-1145','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1241','생화학','권형진','3','월수0900-1015','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1242','산업미생물학','홍순광','3','월수1030-1145','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1243','바이러스학','이원근','3','화목1800-1950','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1244','면역학','이창로','3','목금1300-1450','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1245','유전학','최상봉','3','화1300-1450','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1246','식물발달생리학','김상현','3','월1300-1350','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1247','식물학','문정환','3','월1400-1450','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1300','통합디자인연구','신완식','3','월0900-1145','design');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1301','디지털디자인','조태형','3','화0900-1150','design');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1302','제품디자인기초','최종운','3','수0900-1150','design');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1303','이미지와표현','최재은','3','목0900-1150','design');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1310','체력측정론','김주학','3','월1000-1150','physical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1311','운동을위한인체구조','박종성','3','화0900-1150','physical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1312','발육과노화','박태섭','3','수0900-1150','physical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1313','동작프로그램개발','고성희','3','목0900-1150','physical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1320','서양음악사','김영옥','2','금1100-1250','music');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1321','반주법','장미경','2','월1000-1150','music');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1322','음악통론','정혜윤','2','화1500-1650','music');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1330','바둑학개론','정수현','3','화1300-1550','baduk');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1331','포석과정석','온소진','3','수1300-1550','baduk');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1332','컴퓨터와바둑','감동근','3','월1300-1550','baduk');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1340','세계영화사','장병원','3','금1000-1250','musical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1341','현대영화의경향','김영진','3','목1400-1650','musical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1342','할리우드영화연구','이길성','3','화1400-1650','musical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1421','건축고고학실습','최종규','3','목0900-1150','architect');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1422','목구조역학','김영민','3','수1500-1750','architect');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1423','한옥실습','백소훈','3','수0900-1150','architect');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1424','동양건축사','김왕직','3','화0900-1150','architect');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1411','건축설계와표현','이재인','4','월1400-1850','basicArchitecture');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1422','건축설계','남수현','5','목1400-1850','basicArchitecture');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1423','건축과문화','김혜정','3','목1400-1450','basicArchitecture');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1424','건축구조의이해','김영민','3','화0900-1150','basicArchitecture');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2111','콘텐츠디자인1','김일주','3','월수0900~1015','digitalContents');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2200','중급회계','김기영','3','화1500-1615,목1500-1615','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2201','재무분석','심명화','3','월1630-1745,수1630-1745','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2202','정부회계','박경진','3','월1500-1615,수1500-1615','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2203','투자론','변영훈','3','월1330-1615,수1330-1445','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2204','브랜드관리','이은정','3','월0900-1015,수0900-1015','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2205','기업법2','이종훈','3','월1330-1445,수1330-1445','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2206','노사관계론','이정현','3','월1030-1145,수1030-1145','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2207','경영조직론','이상명','3','월1200-1315,수1200-1315','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2208','관리회계','정다미','3','월1200-1315,수1200-1315','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5996','국제무역론','조미진','3','월수1030-1145','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5999','국제경제기구론','김태황','3','화목0900-1015','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6000','무역실무','조병휘','3','월수1630-1745','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6001','국제물류의이해','최가영','3','월수1030-1145','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6002','글로벌강소기업론','박재석','3','화목1030-1145','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5988','정보공학','정동길','3','월수0900-1015','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5989','법경제','김호균','3','화목1330-1445','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5990','정보보호입문','정동길','3','월수1030-1145','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5991','ERP개발','박성헌','3','화1500-1745','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5993','회계정보시스템','김성구','3','화목0900-1015','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6228','감정평가이론','이수겸','3','토1300-1550','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7048','부동산개발론','조인창','3','수2020-2245','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7049','부동산컨설팅','권대중','3','수2020-2245','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7051','부동산자산관리론','순희자','3','토1300-1550','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7052','부동산개발사례연구','조인창','3','토1300-1550','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7069','부동산입지론','김준형','3','수2020-2245','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1190','교육관리학','김성일','3','월1300-1550','managementEducation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','행정학의이해','이현정','3','목1200-1445','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','지방행정론','임승빈','3','월수0900-1015','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','정책학원론','이시연','3','목0900-1145','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','사회복지정책론','이재성','3','화1200-1445','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','재정학','전성훈','3','수1500-1745','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6','조직행태론','진종순','3','월수1330-1445','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2321','경제통계','이명훈','3','수금1330-1445','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2322','경제체제론','홍제환','3','화0900-1145','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2323','국제경제학','안병창','3','금1030-1315','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2324','한국경제사','김두얼','3','화목1030-1145','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2325','화폐와금융','안종길','3','화목1330-1445','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2321','정치학개론','정회옥','3','월수1200-1315','politics');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2322','국제정치론','정성철','3','화목1330-1445','politics');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2323','정치심리학','김도종','3','화1500-1745','politics');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2331','미디어의이해','이병혜','3','월수1330-1445','digitalMedia');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2332','커뮤니케이션이론','김기태','3','금1500-1745','digitalMedia');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2333','디지털미디어기술사회','최선규','3','화목1200-1315','digitalMedia');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2341','아동학취업세미나','김진욱','3','수1500-1745','children');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2342','한국가족생활문화','김윤전','3','월1500-1745','children');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2343','아동건강교육','김민경','3','월1200-1445','children');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2350','청소년지도학2','조미영','2','금1000-1150','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2351','청소년문화','권일남','3','월1500-1615,수1500-1615','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2352','청소년심리및상담','한영희','3','월0900-1145','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2353','청소년활동','권일남','3','목1500-1745','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2354','청소년기관운영','박대권','3','화1200-1315,목1200-1315','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2355','성격심리','이랑주','3','목0900-1145','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2356','청소년육성제도론','김정율','3','화1750-2015','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2357','정지취업세미나','박대권','2','월1100-1250','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2358','집단상담','이은경','3','화0900-1145','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2359','청소년교육론','조아미','3','월1330-1445,수1330-1445','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2360','사회복지행정론','이재성','3','토1600-1835','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2361','가족복지론','김희진','3','토1300-1550','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2362','사회복지현장실습','김민아','3','토0900-1150','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2363','영화와사회복지','최인화','3','수2020-2245','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2364','사회복지세미나','안희철','3','토0900-1150','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2365','사회복지조사론','백주희','3','토1300-1550','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2400','국어학의이해','조남호','3','월1030-1315','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2401','국문학개론','남재철','3','월1500-1745','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2403','고전소설론','이창헌','3','월1430-1715','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2404','국어문법론','윤용선','3','화1200-1445','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2405','현대시교육론','송승환','3','금1200-1445','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2407','한국현대소설특강','이수형','3','목1030-1315','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2408','국어학사','조남호','3','화1030-1315','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2409','한국한문학선독(honor)','남재철','3','화1500-1745','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2410','중국어현장답사','강연','2','화1630-1815','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2411','중국어발음원리와연습','김보경','3','화1500-1745','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2412','중국어회화2','김명구','3','월1500-1745','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2414','중국고문읽기','김선희','3','화1500-1745','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2416','중국소설의이해','김명구','3','목1330-1545','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2417','중국어회화4','강연','3','화1200-1445','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2418','중국어문법','성기은','3','월0900-1145','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2402','국문학개론C','남재철','3','금0900-1145','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2413','중국어회화2C','최석원','3','목0900-1145','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2415','중국고문읽기C','주성일','3','수1500-1745','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2419','중국어문법C','성기은','3','화0900-1145','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2420','초급일본어회화2','스미유리카','3','월1030-1315','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2421','전공기초일본어2','이은미','3','화1330-1615','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2422','중급일본어회화2','사이코아사코','3','화0900-1145','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2423','일본어강독2','이신혜','3','목1500-1745','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2424','실용일본어작문','신은진','3','금1500-1745','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2425','일본현대어문법','윤상실','3','월0900-1145','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2426','일문학의이해','오찬욱','3','화1500-1745','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2427','일본애니메이션의이해','오찬욱','3','수0900-1145','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2428','매스컴일본어','오찬욱','3','목1500-1745','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2429','일본인의언어생활','윤상실','3','금0900-1145','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2430','영문학개론','이기한','3','수1200-1315','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2431','영어듣기의이론과실제','콜린워커','3','목1030-1145','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2432','영미문학강독','손일수','3','금0900-1145','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2433','중급영어회하','콜린워커','3','월0900-1015','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2434','영어교육론','장지연','3','월1630-1745','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2440','한국사강독','박진훈','3','월1630-1745','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2441','동양고대사','최해별','3','월1030-1145','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2442','서양고대사','황원호','3','월1500-1745','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2443','동양사강독','정철웅','3','화1630-1745','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2444','동양근대사','최병욱','3','화1330-1445','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2450','정보학입문','김현희','3','월1330-1445','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2451','도서관정보센터경영론','배창섭','3','월1500-1745','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2452','정보문화사','송승섭','3','화1030-1145','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2453','참고정보봉사론','권나현','3','화1330-1445','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2454','고문헌조직론','안미경','3','화1500-1745','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','한국미술사','이주현','3','월0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','서양미술사','이지은','3','월0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','동양미술사','이태호','3','월0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','일본미술사','최선아','3','월0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','한국공예사','박정민','3','월0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','인식론','김준성','3','화0900-1015','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','철학원론','강순전','3','화1030-1145','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','논리학','김윤구','3','화1200-1300','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','정의론','김한상','3','화1300-1450','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','합리론','임석진','3','화1500-1615','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','기초아랍어','안정국','3','화0900-1015','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','아랍어문법','이종화','3','화1030-1145','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','중급아랍어','조희선','3','화1200-1300','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','아랍각국경제','송경근','3','화1300-1450','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','아랍각국정치','김정명','3','화1500-1615','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','시의이해','박상수','3','목1030-1315','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','소설의이해','김종욱','3','월1500-1745','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','시창작연구','남진우','3','금1500-1745','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','소설창작연구','신수정','3','화1330-1615','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','희곡의이해','이재명','3','월수1030-1145','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6','소설구성론','노태훈','3','화목1630-1745','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2501','저작권과소프트웨어','김선주','3','수0900~1015','lawC');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2321','정치학개론C','정회옥','3','월수1200-1315','politicsL');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2322','국제정치론C','정성철','3','화목1330-1445','politicsL');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2323','정치심리학C','김도종','3','화1500-1745','politicsL');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1010','영어1C','여인욱','3','월수1030-1145','englishYGS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1011','영어회화1C','다니엘','2','월수1030-1145','englishYGS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1020','글쓰기C','육민수','3','월수1030-1145','basicS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1021','발표와토의C','주민재','3','월수1030-1145','basicS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1030','한국근현대사의이해C','윤홍석','3','월수1030-1145','selectiveS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1031','민주주의와현대사회C','윤홍석','3','월수1030-1145','selectiveS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2121','객체지향적사고와프로그래밍','최성운','3','월수0900~1015','software');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5992','데이터웨어하우징과마이닝','서필교','3','월수0900-1015','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2406','신화와설화다시읽기(honor)','이창헌','3','화1330-1615','korean');
--------------------------------------------------------
--  DDL for Index SYS_C007156
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007156" ON "SYSTEM"."GANGJWA" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table GANGJWA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."GANGJWA" ADD PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."GANGJWA" MODIFY ("HACKGWA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GANGJWA" MODIFY ("TIME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GANGJWA" MODIFY ("CREDIT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GANGJWA" MODIFY ("LECTURER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."GANGJWA" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table GANGJWA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."GANGJWA" ADD FOREIGN KEY ("HACKGWA")
	  REFERENCES "SYSTEM"."HACKGWA" ("FILENAME") ENABLE;
      
      --USERID 테이블 생성
      
      --------------------------------------------------------
--  DDL for Table USERID
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."USERID" 
   (	"USERID" VARCHAR2(15 BYTE), 
	"PASSWORD" VARCHAR2(10 BYTE), 
	"NAME" VARCHAR2(15 BYTE), 
	"UNUMBER" VARCHAR2(15 BYTE), 
	"HACKGWA" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.USERID
SET DEFINE OFF;
Insert into SYSTEM.USERID (USERID,PASSWORD,NAME,UNUMBER,HACKGWA) values ('Lee','tkfkd1617!','이정우','60191902','경영학과');
Insert into SYSTEM.USERID (USERID,PASSWORD,NAME,UNUMBER,HACKGWA) values ('kim','5678','김정우','60191902','응용소프트웨어학과');
--------------------------------------------------------
--  DDL for Index SYS_C007033
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007033" ON "SYSTEM"."USERID" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table USERID
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."USERID" ADD PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."USERID" MODIFY ("UNUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERID" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."USERID" MODIFY ("USERID" NOT NULL ENABLE);
      
      --KIM유저생성
      
      --------------------------------------------------------
--  DDL for Table KIM
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."KIM" 
   (	"USERID" VARCHAR2(15 BYTE), 
	"PASSWORD" VARCHAR2(10 BYTE), 
	"NAME" VARCHAR2(15 BYTE), 
	"UNUMBER" VARCHAR2(15 BYTE), 
	"HACKGWA" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.KIM
SET DEFINE OFF;
Insert into SYSTEM.KIM (USERID,PASSWORD,NAME,UNUMBER,HACKGWA) values ('kim','5678','김정우','60191902','응용소프트웨어학과');
--------------------------------------------------------
--  DDL for Index SYS_C007057
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007057" ON "SYSTEM"."KIM" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table KIM
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KIM" ADD PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."KIM" MODIFY ("HACKGWA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIM" MODIFY ("UNUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIM" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIM" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIM" MODIFY ("USERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table KIM
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KIM" ADD FOREIGN KEY ("USERID")
	  REFERENCES "SYSTEM"."USERID" ("USERID") ENABLE;
      
      --------------------------------------------------------
--  DDL for Table KIMM
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."KIMM" 
   (	"ID" VARCHAR2(5 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"LECTURER" VARCHAR2(30 BYTE), 
	"CREDIT" VARCHAR2(30 BYTE), 
	"TIME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.KIMM
SET DEFINE OFF;
Insert into SYSTEM.KIMM (ID,NAME,LECTURER,CREDIT,TIME) values ('2400','국어학의이해','조남호','3','월1030-1315');
Insert into SYSTEM.KIMM (ID,NAME,LECTURER,CREDIT,TIME) values ('4','아랍각국경제','송경근','3','화1300-1450');
Insert into SYSTEM.KIMM (ID,NAME,LECTURER,CREDIT,TIME) values ('2401','국문학개론','남재철','3','월1500-1745');
Insert into SYSTEM.KIMM (ID,NAME,LECTURER,CREDIT,TIME) values ('6228','감정평가이론','이수겸','3','토1300-1550');
--------------------------------------------------------
--  DDL for Index SYS_C007163
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007163" ON "SYSTEM"."KIMM" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table KIMM
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KIMM" ADD PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."KIMM" MODIFY ("TIME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIMM" MODIFY ("CREDIT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIMM" MODIFY ("LECTURER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIMM" MODIFY ("NAME" NOT NULL ENABLE);
  
  --------------------------------------------------------
--  DDL for Table KIMS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."KIMS" 
   (	"ID" VARCHAR2(5 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"LECTURER" VARCHAR2(30 BYTE), 
	"CREDIT" VARCHAR2(30 BYTE), 
	"TIME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.KIMS
SET DEFINE OFF;
Insert into SYSTEM.KIMS (ID,NAME,LECTURER,CREDIT,TIME) values ('5988','정보공학','정동길','3','월수0900-1015');
Insert into SYSTEM.KIMS (ID,NAME,LECTURER,CREDIT,TIME) values ('5989','법경제','김호균','3','화목1330-1445');
--------------------------------------------------------
--  DDL for Index SYS_C007169
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007169" ON "SYSTEM"."KIMS" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table KIMS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KIMS" ADD PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."KIMS" MODIFY ("TIME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIMS" MODIFY ("CREDIT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIMS" MODIFY ("LECTURER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KIMS" MODIFY ("NAME" NOT NULL ENABLE);

--Lee 유저 생성 

--------------------------------------------------------
--  DDL for Table LEE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LEE" 
   (	"USERID" VARCHAR2(15 BYTE), 
	"PASSWORD" VARCHAR2(10 BYTE), 
	"NAME" VARCHAR2(15 BYTE), 
	"UNUMBER" VARCHAR2(15 BYTE), 
	"HACKGWA" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.LEE
SET DEFINE OFF;
Insert into SYSTEM.LEE (USERID,PASSWORD,NAME,UNUMBER,HACKGWA) values ('Lee','tkfkd1617!','이정우','60191902','경영학과');
--------------------------------------------------------
--  DDL for Index SYS_C007323
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007323" ON "SYSTEM"."LEE" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table LEE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LEE" ADD PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."LEE" MODIFY ("HACKGWA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEE" MODIFY ("UNUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEE" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEE" MODIFY ("USERID" NOT NULL ENABLE);
  
  --------------------------------------------------------
--  DDL for Table LEEM
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LEEM" 
   (	"ID" VARCHAR2(15 BYTE), 
	"NAME" VARCHAR2(40 BYTE), 
	"LECTURER" VARCHAR2(20 BYTE), 
	"CREDIT" VARCHAR2(15 BYTE), 
	"TIME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.LEEM
SET DEFINE OFF;
Insert into SYSTEM.LEEM (ID,NAME,LECTURER,CREDIT,TIME) values ('1010','영어1','여인욱','3','월수1030-1145');
--------------------------------------------------------
--  DDL for Index SYS_C007329
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007329" ON "SYSTEM"."LEEM" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table LEEM
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LEEM" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."LEEM" MODIFY ("TIME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEEM" MODIFY ("CREDIT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEEM" MODIFY ("LECTURER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEEM" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEEM" MODIFY ("ID" NOT NULL ENABLE);
  
  --------------------------------------------------------
--  DDL for Table LEES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LEES" 
   (	"ID" VARCHAR2(15 BYTE), 
	"NAME" VARCHAR2(40 BYTE), 
	"LECTURER" VARCHAR2(20 BYTE), 
	"CREDIT" VARCHAR2(15 BYTE), 
	"TIME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.LEES
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C007335
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007335" ON "SYSTEM"."LEES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table LEES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LEES" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."LEES" MODIFY ("TIME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEES" MODIFY ("CREDIT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEES" MODIFY ("LECTURER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEES" MODIFY ("ID" NOT NULL ENABLE);
  
  --DELETE TABLE OPTION
--drop table "SYSTEM"."LEES" ;
--drop table "SYSTEM"."LEEM" ;
--drop table "SYSTEM"."LEE" ;
--drop table "SYSTEM"."KIMS" ;
--drop table "SYSTEM"."KIMM" ;
--drop table "SYSTEM"."KIM" ;
--drop table "SYSTEM"."USERID" ;
--drop table "SYSTEM"."GANGJWA";
--drop table "SYSTEM"."HACKGWA";
--drop table "SYSTEM"."COLLEGE";
--drop table "SYSTEM"."CAMPUS";

      