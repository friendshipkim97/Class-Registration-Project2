--ķ�۽����̺����
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
Insert into SYSTEM.CAMPUS (ID,NAME,FILENAME) values ('1','����','yongin');
Insert into SYSTEM.CAMPUS (ID,NAME,FILENAME) values ('2','����','seoul');
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
  
  --�������̺����
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
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('10','����','generalY','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('11','��������','engineering','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('12','�ڿ����д���','science','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('13','����ü������','art','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('13','�������','architecture','yongin');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('20','����','generalS','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('21','ICT���մ���','ict','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('22','�濵����','business','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('23','��ȸ���д���','social','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('24','�ι�����','human','seoul');
Insert into SYSTEM.COLLEGE (ID,NAME,FILENAME,CAMPUS) values ('25','���д���','law','seoul');
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

--�а����̺� ����
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
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('101','�����','englishYG','generalY');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('102','���ʱ���','basic','generalY');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('103','���ñ���','selective','generalY');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('111','������а�','electricity','engineering');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('112','��ǻ�Ͱ��а�','computer','engineering');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('120','���а�','math','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('121','�����а�','physics','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('122','ȭ�а�','chemistry','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('124','������������а�','life','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('123','��ǰ�����а�','food','science');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('130','�������к�','design','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('131','ü���к�','physical','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('132','�����к�','music','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('133','�ٵ��а�','baduk','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('134','��ȭ/�������к�','musical','art');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('140','�����к�','architect','architecture');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('141','��������������','basicArchitecture','architecture');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('211','������������','digitalContents','ict');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('212','���ռ���Ʈ����','software','ict');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('220','�濵�а�','management','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('221','��������а�','internationalTrade','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('222','�濵�����а�','managementInformation','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('223','�ε����а�','property','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('224','�濵�������ż���','managementEducation','business');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('201','�����','englishYGS','generalS');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('202','���ʱ���','basicS','generalS');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('203','���ñ���','selectiveS','generalS');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('230','�����а�','administration','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('231','�����а�','economy','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('232','��ġ�ܱ��а�','politics','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('233','�����й̵���а�','children','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('235','û�ҳ������а�','teenager','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('236','��ȸ�����а�','welfare','social');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('240','������а�','korean','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('241','�߾��߹��а�','chinese','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('242','�Ͼ��Ϲ��а�','japanese','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('243','������а�','english','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('244','���а�','history','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('245','���������а�','library','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('246','�̼����а�','artHistory','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('247','ö�а�','philosophy','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('248','�ƶ������а�','arab','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('249','����â�۰�','writing','human');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('250','���а�','lawC','law');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('251','������å�а�','politicsL','law');
Insert into SYSTEM.HACKGWA (ID,NAME,FILENAME,COLLEGE) values ('233','�����й̵���а�','digitalMedia','social');
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

--�������̺� ����
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
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1010','����1','���ο�','3','����1030-1145','englishYG');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1011','����ȸȭ1','�ٴϿ�','2','����1030-1145','englishYG');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1020','�۾���','���μ�','3','����1030-1145','basic');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1021','��ǥ������','�ֹ���','3','����1030-1145','basic');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1030','�ѱ��������������','��ȫ��','3','����1030-1145','selective');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1031','�������ǿ������ȸ','��ȫ��','3','����1030-1145','selective');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1110','��������1','��μ�','3','����0900-1015','electricity');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1111','��������2','��μ�','3','����1030-1145','electricity');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1210','C���','������','3','ȭ��1800-1900','computer');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1211','�ý��۰����α׷���','�ǵ���','4','���1300-1400','computer');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1221','���б��翬����������','������','2','ȭ1300-1445','math');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1222','������','�Ҽ���','3','��1300-1345','math');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1223','�ؼ��а���','ȫ����','3','��1400-1445','math');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1310','������','������','3','��1000-1145','physics');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1140','ȭ��2','�輱��','3','����0900-1015','chemistry');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1230','��ǰ��','Ȳ����','3','��1300-1345','food');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1240','�̻�����','�̻���','4','����1030-1145','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1241','��ȭ��','������','3','����0900-1015','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1242','����̻�����','ȫ����','3','����1030-1145','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1243','���̷�����','�̿���','3','ȭ��1800-1950','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1244','�鿪��','��â��','3','���1300-1450','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1245','������','�ֻ��','3','ȭ1300-1450','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1246','�Ĺ��ߴ޻�����','�����','3','��1300-1350','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1247','�Ĺ���','����ȯ','3','��1400-1450','life');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1300','���յ����ο���','�ſϽ�','3','��0900-1145','design');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1301','�����е�����','������','3','ȭ0900-1150','design');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1302','��ǰ�����α���','������','3','��0900-1150','design');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1303','�̹�����ǥ��','������','3','��0900-1150','design');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1310','ü��������','������','3','��1000-1150','physical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1311','���������ü����','������','3','ȭ0900-1150','physical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1312','��������ȭ','���¼�','3','��0900-1150','physical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1313','�������α׷�����','����','3','��0900-1150','physical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1320','�������ǻ�','�迵��','2','��1100-1250','music');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1321','���ֹ�','��̰�','2','��1000-1150','music');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1322','�������','������','2','ȭ1500-1650','music');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1330','�ٵ��а���','������','3','ȭ1300-1550','baduk');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1331','����������','�¼���','3','��1300-1550','baduk');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1332','��ǻ�Ϳ͹ٵ�','������','3','��1300-1550','baduk');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1340','���迵ȭ��','�庴��','3','��1000-1250','musical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1341','���뿵ȭ�ǰ���','�迵��','3','��1400-1650','musical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1342','�Ҹ���念ȭ����','�̱漺','3','ȭ1400-1650','musical');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1421','�������нǽ�','������','3','��0900-1150','architect');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1422','��������','�迵��','3','��1500-1750','architect');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1423','�ѿ��ǽ�','�����','3','��0900-1150','architect');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1424','��������','�����','3','ȭ0900-1150','architect');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1411','���༳���ǥ��','������','4','��1400-1850','basicArchitecture');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1422','���༳��','������','5','��1400-1850','basicArchitecture');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1423','�������ȭ','������','3','��1400-1450','basicArchitecture');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1424','���౸��������','�迵��','3','ȭ0900-1150','basicArchitecture');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2111','������������1','������','3','����0900~1015','digitalContents');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2200','�߱�ȸ��','��⿵','3','ȭ1500-1615,��1500-1615','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2201','�繫�м�','�ɸ�ȭ','3','��1630-1745,��1630-1745','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2202','����ȸ��','�ڰ���','3','��1500-1615,��1500-1615','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2203','���ڷ�','������','3','��1330-1615,��1330-1445','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2204','�귣�����','������','3','��0900-1015,��0900-1015','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2205','�����2','������','3','��1330-1445,��1330-1445','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2206','�������','������','3','��1030-1145,��1030-1145','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2207','�濵������','�̻��','3','��1200-1315,��1200-1315','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2208','����ȸ��','���ٹ�','3','��1200-1315,��1200-1315','management');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5996','����������','������','3','����1030-1145','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5999','���������ⱸ��','����Ȳ','3','ȭ��0900-1015','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6000','�����ǹ�','������','3','����1630-1745','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6001','��������������','�ְ���','3','����1030-1145','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6002','�۷ι����ұ����','���缮','3','ȭ��1030-1145','internationalTrade');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5988','��������','������','3','����0900-1015','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5989','������','��ȣ��','3','ȭ��1330-1445','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5990','������ȣ�Թ�','������','3','����1030-1145','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5991','ERP����','�ڼ���','3','ȭ1500-1745','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5993','ȸ�������ý���','�輺��','3','ȭ��0900-1015','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6228','�������̷�','�̼���','3','��1300-1550','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7048','�ε��갳�߷�','����â','3','��2020-2245','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7049','�ε���������','�Ǵ���','3','��2020-2245','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7051','�ε����ڻ������','������','3','��1300-1550','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7052','�ε��갳�߻�ʿ���','����â','3','��1300-1550','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('7069','�ε���������','������','3','��2020-2245','property');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1190','����������','�輺��','3','��1300-1550','managementEducation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','������������','������','3','��1200-1445','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','����������','�ӽº�','3','����0900-1015','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','��å�п���','�̽ÿ�','3','��0900-1145','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','��ȸ������å��','���缺','3','ȭ1200-1445','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','������','������','3','��1500-1745','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6','�������·�','������','3','����1330-1445','administration');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2321','�������','�̸���','3','����1330-1445','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2322','����ü����','ȫ��ȯ','3','ȭ0900-1145','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2323','����������','�Ⱥ�â','3','��1030-1315','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2324','�ѱ�������','��ξ�','3','ȭ��1030-1145','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2325','ȭ��ͱ���','������','3','ȭ��1330-1445','economy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2321','��ġ�а���','��ȸ��','3','����1200-1315','politics');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2322','������ġ��','����ö','3','ȭ��1330-1445','politics');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2323','��ġ�ɸ���','�赵��','3','ȭ1500-1745','politics');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2331','�̵��������','�̺���','3','����1330-1445','digitalMedia');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2332','Ŀ�´����̼��̷�','�����','3','��1500-1745','digitalMedia');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2333','�����й̵������ȸ','�ּ���','3','ȭ��1200-1315','digitalMedia');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2341','�Ƶ���������̳�','������','3','��1500-1745','children');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2342','�ѱ�������Ȱ��ȭ','������','3','��1500-1745','children');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2343','�Ƶ��ǰ�����','��ΰ�','3','��1200-1445','children');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2350','û�ҳ�������2','���̿�','2','��1000-1150','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2351','û�ҳ⹮ȭ','���ϳ�','3','��1500-1615,��1500-1615','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2352','û�ҳ�ɸ��׻��','�ѿ���','3','��0900-1145','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2353','û�ҳ�Ȱ��','���ϳ�','3','��1500-1745','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2354','û�ҳ����','�ڴ��','3','ȭ1200-1315,��1200-1315','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2355','���ݽɸ�','�̶���','3','��0900-1145','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2356','û�ҳ�����������','������','3','ȭ1750-2015','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2357','����������̳�','�ڴ��','2','��1100-1250','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2358','���ܻ��','������','3','ȭ0900-1145','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2359','û�ҳⱳ����','���ƹ�','3','��1330-1445,��1330-1445','teenager');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2360','��ȸ����������','���缺','3','��1600-1835','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2361','����������','������','3','��1300-1550','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2362','��ȸ��������ǽ�','��ξ�','3','��0900-1150','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2363','��ȭ�ͻ�ȸ����','����ȭ','3','��2020-2245','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2364','��ȸ�������̳�','����ö','3','��0900-1150','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2365','��ȸ���������','������','3','��1300-1550','welfare');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2400','������������','����ȣ','3','��1030-1315','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2401','�����а���','����ö','3','��1500-1745','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2403','�����Ҽ���','��â��','3','��1430-1715','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2404','�������','���뼱','3','ȭ1200-1445','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2405','����ñ�����','�۽�ȯ','3','��1200-1445','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2407','�ѱ�����Ҽ�Ư��','�̼���','3','��1030-1315','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2408','�����л�','����ȣ','3','ȭ1030-1315','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2409','�ѱ��ѹ��м���(honor)','����ö','3','ȭ1500-1745','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2410','�߱���������','����','2','ȭ1630-1815','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2411','�߱�����������Ϳ���','�躸��','3','ȭ1500-1745','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2412','�߱���ȸȭ2','���','3','��1500-1745','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2414','�߱����б�','�輱��','3','ȭ1500-1745','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2416','�߱��Ҽ�������','���','3','��1330-1545','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2417','�߱���ȸȭ4','����','3','ȭ1200-1445','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2418','�߱����','������','3','��0900-1145','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2402','�����а���C','����ö','3','��0900-1145','korean');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2413','�߱���ȸȭ2C','�ּ���','3','��0900-1145','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2415','�߱����б�C','�ּ���','3','��1500-1745','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2419','�߱����C','������','3','ȭ0900-1145','chinese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2420','�ʱ��Ϻ���ȸȭ2','��������ī','3','��1030-1315','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2421','���������Ϻ���2','������','3','ȭ1330-1615','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2422','�߱��Ϻ���ȸȭ2','�����ھƻ���','3','ȭ0900-1145','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2423','�Ϻ����2','�̽���','3','��1500-1745','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2424','�ǿ��Ϻ����۹�','������','3','��1500-1745','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2425','�Ϻ�������','�����','3','��0900-1145','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2426','�Ϲ���������','������','3','ȭ1500-1745','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2427','�Ϻ��ִϸ��̼�������','������','3','��0900-1145','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2428','�Ž����Ϻ���','������','3','��1500-1745','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2429','�Ϻ����Ǿ���Ȱ','�����','3','��0900-1145','japanese');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2430','�����а���','�̱���','3','��1200-1315','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2431','���������̷а�����','�ݸ���Ŀ','3','��1030-1145','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2432','���̹��а���','���ϼ�','3','��0900-1145','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2433','�߱޿���ȸ��','�ݸ���Ŀ','3','��0900-1015','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2434','�������','������','3','��1630-1745','english');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2440','�ѱ��簭��','������','3','��1630-1745','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2441','�������','���غ�','3','��1030-1145','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2442','�������','Ȳ��ȣ','3','��1500-1745','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2443','����簭��','��ö��','3','ȭ1630-1745','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2444','����ٴ��','�ֺ���','3','ȭ1330-1445','history');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2450','�������Թ�','������','3','��1330-1445','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2451','�������������Ͱ濵��','��â��','3','��1500-1745','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2452','������ȭ��','�۽¼�','3','ȭ1030-1145','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2453','�������������','�ǳ���','3','ȭ1330-1445','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2454','����������','�ȹ̰�','3','ȭ1500-1745','library');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','�ѱ��̼���','������','3','��0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','����̼���','������','3','��0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','����̼���','����ȣ','3','��0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','�Ϻ��̼���','�ּ���','3','��0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','�ѱ�������','������','3','��0900-1015','artHistory');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','�νķ�','���ؼ�','3','ȭ0900-1015','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','ö�п���','������','3','ȭ1030-1145','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','����','������','3','ȭ1200-1300','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','���Ƿ�','���ѻ�','3','ȭ1300-1450','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','�ո���','�Ӽ���','3','ȭ1500-1615','philosophy');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','���ʾƶ���','������','3','ȭ0900-1015','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','�ƶ����','����ȭ','3','ȭ1030-1145','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','�߱޾ƶ���','����','3','ȭ1200-1300','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','�ƶ���������','�۰��','3','ȭ1300-1450','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','�ƶ�������ġ','������','3','ȭ1500-1615','arab');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1','��������','�ڻ��','3','��1030-1315','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2','�Ҽ�������','������','3','��1500-1745','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('3','��â�ۿ���','������','3','��1500-1745','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('4','�Ҽ�â�ۿ���','�ż���','3','ȭ1330-1615','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5','���������','�����','3','����1030-1145','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('6','�Ҽ�������','������','3','ȭ��1630-1745','writing');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2501','���۱ǰ�����Ʈ����','�輱��','3','��0900~1015','lawC');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2321','��ġ�а���C','��ȸ��','3','����1200-1315','politicsL');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2322','������ġ��C','����ö','3','ȭ��1330-1445','politicsL');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2323','��ġ�ɸ���C','�赵��','3','ȭ1500-1745','politicsL');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1010','����1C','���ο�','3','����1030-1145','englishYGS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1011','����ȸȭ1C','�ٴϿ�','2','����1030-1145','englishYGS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1020','�۾���C','���μ�','3','����1030-1145','basicS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1021','��ǥ������C','�ֹ���','3','����1030-1145','basicS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1030','�ѱ��������������C','��ȫ��','3','����1030-1145','selectiveS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('1031','�������ǿ������ȸC','��ȫ��','3','����1030-1145','selectiveS');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2121','��ü�������������α׷���','�ּ���','3','����0900~1015','software');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('5992','�����Ϳ����Ͽ�¡�����̴�','���ʱ�','3','����0900-1015','managementInformation');
Insert into SYSTEM.GANGJWA (ID,NAME,LECTURER,CREDIT,TIME,HACKGWA) values ('2406','��ȭ�ͼ�ȭ�ٽ��б�(honor)','��â��','3','ȭ1330-1615','korean');
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
      
      --USERID ���̺� ����
      
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
Insert into SYSTEM.USERID (USERID,PASSWORD,NAME,UNUMBER,HACKGWA) values ('Lee','tkfkd1617!','������','60191902','�濵�а�');
Insert into SYSTEM.USERID (USERID,PASSWORD,NAME,UNUMBER,HACKGWA) values ('kim','5678','������','60191902','�������Ʈ�����а�');
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
      
      --KIM��������
      
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
Insert into SYSTEM.KIM (USERID,PASSWORD,NAME,UNUMBER,HACKGWA) values ('kim','5678','������','60191902','�������Ʈ�����а�');
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
Insert into SYSTEM.KIMM (ID,NAME,LECTURER,CREDIT,TIME) values ('2400','������������','����ȣ','3','��1030-1315');
Insert into SYSTEM.KIMM (ID,NAME,LECTURER,CREDIT,TIME) values ('4','�ƶ���������','�۰��','3','ȭ1300-1450');
Insert into SYSTEM.KIMM (ID,NAME,LECTURER,CREDIT,TIME) values ('2401','�����а���','����ö','3','��1500-1745');
Insert into SYSTEM.KIMM (ID,NAME,LECTURER,CREDIT,TIME) values ('6228','�������̷�','�̼���','3','��1300-1550');
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
Insert into SYSTEM.KIMS (ID,NAME,LECTURER,CREDIT,TIME) values ('5988','��������','������','3','����0900-1015');
Insert into SYSTEM.KIMS (ID,NAME,LECTURER,CREDIT,TIME) values ('5989','������','��ȣ��','3','ȭ��1330-1445');
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

--Lee ���� ���� 

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
Insert into SYSTEM.LEE (USERID,PASSWORD,NAME,UNUMBER,HACKGWA) values ('Lee','tkfkd1617!','������','60191902','�濵�а�');
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
Insert into SYSTEM.LEEM (ID,NAME,LECTURER,CREDIT,TIME) values ('1010','����1','���ο�','3','����1030-1145');
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

      