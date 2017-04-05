
set lines 180
set pages 400
set echo on
set feedback on

spool rdm_rfc_13932_script.log


SET DEFINE OFF;

CREATE SEQUENCE RDM.SQA_QC_DETAILS_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_EMPLS_SEQ
  START WITH 1
  MAXVALUE 999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_FILES_LIST_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_FILE_TYPES_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_HR_REPORT_STG_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_JOB_TITLES_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_LOAN_CLIENT_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_MASTER_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_QUESTION_REPLY_SEQ
  START WITH 1
  MAXVALUE 999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_QUESTION_SETS_SEQ
  START WITH 1
  MAXVALUE 999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE RDM.SQA_QC_SECURITY_LEVELS_SEQ
  START WITH 1
  MAXVALUE 999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;



CREATE TABLE RDM.SQA_QC_DETAILS
(
  PID                        NUMBER,
  MASTER_ID                  NUMBER,
  QC_COORDINATOR             VARCHAR2(100 BYTE),
  EMPLOYEE_TYPE              VARCHAR2(100 BYTE),
  LOAN_NUMBER                VARCHAR2(40 BYTE),
  ORDER_NUMBER               VARCHAR2(40 BYTE),
  WORK_CODE                  VARCHAR2(40 BYTE),
  PROCESSOR                  VARCHAR2(100 BYTE),
  EMPL_SUPERVISOR            VARCHAR2(100 BYTE),
  EMPL_TEAM_LEAD             VARCHAR2(100 BYTE),
  JOB_TITLE                  VARCHAR2(200 BYTE),
  INSPECTION_REVIEW          VARCHAR2(100 BYTE),
  WO_ENTRY_COMPON            VARCHAR2(100 BYTE),
  WO_INSTR_COMPL_AUD         VARCHAR2(100 BYTE),
  WO_INSTR_COMPL             VARCHAR2(100 BYTE),
  BID_SUB_APPEAL             VARCHAR2(100 BYTE),
  SPI_GLASS_DAMAGE           VARCHAR2(100 BYTE),
  SPI_GLASS_BID              VARCHAR2(100 BYTE),
  HARDCODING_STATUS          VARCHAR2(100 BYTE),
  INVOICING_ACCURATE         VARCHAR2(100 BYTE),
  ARCHER_CARCH_SPI           VARCHAR2(100 BYTE),
  COMMENTS                   VARCHAR2(4000 BYTE),
  TOTAL_POINTS_EARNED        NUMBER,
  POSSIBLE_POINTS            NUMBER,
  PERCENT_SCORE              NUMBER,
  MGMT_REVIEW_DATE           DATE,
  PASS_FAIL                  VARCHAR2(100 BYTE),
  MGMT_COMMENTS              VARCHAR2(4000 BYTE),
  REBUTTAL_DEADLINE          DATE,
  REBUTTAL_DATE              DATE,
  REBUTTAL_OUTCOME           VARCHAR2(200 BYTE),
  NON_REBUTTAL               VARCHAR2(1000 BYTE),
  WORKING                    NUMBER,
  COMPLETED                  DATE,
  COMMENTS_12                VARCHAR2(4000 BYTE),
  COMMENTS_13                VARCHAR2(4000 BYTE),
  COMMENTS_14                VARCHAR2(4000 BYTE),
  COMMENTS_15                VARCHAR2(4000 BYTE),
  COMMENTS_16                VARCHAR2(4000 BYTE),
  COMMENTS_17                VARCHAR2(4000 BYTE),
  COMMENTS_18                VARCHAR2(4000 BYTE),
  COMMENTS_19                VARCHAR2(4000 BYTE),
  COMMENTS_20                VARCHAR2(4000 BYTE),
  COMMENTS_21                VARCHAR2(4000 BYTE),
  LOAN_TYPE                  VARCHAR2(100 BYTE),
  BIDS_VENDOR                VARCHAR2(100 BYTE),
  COMMENTS_46                VARCHAR2(4000 BYTE),
  INVOICING_ACCURATE_VENDOR  VARCHAR2(100 BYTE),
  COMMENTS_48                VARCHAR2(4000 BYTE),
  CLIENT                     VARCHAR2(20 BYTE),
  HOME_DEPARTMENT            VARCHAR2(200 BYTE),
  VENDOR                     VARCHAR2(30 BYTE),
  START_DATE                 DATE
)
/

CREATE TABLE RDM.SQA_QC_EMPLS
(
  LOGIN           VARCHAR2(100 BYTE),
  DATA_DATE       DATE                          DEFAULT SYSDATE,
  STATUS          NUMBER,
  PID             NUMBER,
  EMAILADDRESS    VARCHAR2(200 BYTE),
  FREE_FORM_NAME  VARCHAR2(100 BYTE)
)
/

CREATE TABLE RDM.SQA_QC_FILES_LIST
(
  PID            NUMBER,
  FILE_TYPE      NUMBER,
  FILE_NAME      VARCHAR2(1000 BYTE),
  RECORDCNT      NUMBER,
  LOAD_DATE      DATE,
  LOADED_BY      VARCHAR2(100 BYTE),
  COMMENTS       VARCHAR2(1000 BYTE),
  BEGIN_LOAD_ID  NUMBER,
  END_LOAD_ID    NUMBER,
  LOADED         NUMBER                         DEFAULT 0
)
/

CREATE TABLE RDM.SQA_QC_FILE_TYPES
(
  PID               NUMBER,
  FILE_TYPE         VARCHAR2(200 BYTE),
  COMMENTS          VARCHAR2(1000 BYTE),
  LOAD_PAGE_NO      NUMBER,
  REPORT_PAGE_ITEM  VARCHAR2(100 BYTE),
  REPORT_PAGE_NO    NUMBER,
  LOAD_PAGE_ITEM    VARCHAR2(100 BYTE)
)
/

CREATE TABLE RDM.SQA_QC_HR_REPORT
(
  EMPLOYEE_NAME       VARCHAR2(100 BYTE),
  JOB_TITLE           VARCHAR2(300 BYTE),
  HOME_DEPARTMENT     VARCHAR2(100 BYTE),
  EMPLOYEE_MGMT       VARCHAR2(100 BYTE),
  EMPLOYEE_TEAM_LEAD  VARCHAR2(100 BYTE),
  FILE_ID             NUMBER,
  LOAD_ID             NUMBER
)
/

CREATE TABLE RDM.SQA_QC_HR_REPORT_STG
(
  EMPLOYEE_NAME       VARCHAR2(100 BYTE),
  JOB_TITLE           VARCHAR2(300 BYTE),
  HOME_DEPARTMENT     VARCHAR2(100 BYTE),
  EMPLOYEE_MGMT       VARCHAR2(100 BYTE),
  EMPLOYEE_TEAM_LEAD  VARCHAR2(100 BYTE),
  FILE_ID             NUMBER,
  LOAD_ID             NUMBER
)
/

CREATE TABLE RDM.SQA_QC_JOB_TITLES
(
  PID           NUMBER,
  JOB_TITLE     VARCHAR2(100 BYTE),
  JOB_NAMES     VARCHAR2(100 BYTE),
  ACTIVE        NUMBER,
  CREATED_DATE  DATE
)
/

CREATE TABLE RDM.SQA_QC_LOAN_CLIENT
(
  LOAN_NUMBER  VARCHAR2(50 BYTE),
  CLIENT_CODE  VARCHAR2(50 BYTE),
  LOAN_TYPE    VARCHAR2(50 BYTE),
  PROCESSED    NUMBER,
  FILE_ID      NUMBER,
  LOAD_ID      NUMBER
)
/

CREATE TABLE RDM.SQA_QC_LOAN_CLIENT_STG
(
  LOAN_NUMBER  VARCHAR2(50 BYTE),
  CLIENT_CODE  VARCHAR2(50 BYTE),
  LOAN_TYPE    VARCHAR2(50 BYTE),
  FILE_ID      NUMBER,
  LOAD_ID      NUMBER
)
/

CREATE TABLE RDM.SQA_QC_MASTER
(
  PID          NUMBER,
  CLIENT       VARCHAR2(40 BYTE),
  LOAN_TYPE    VARCHAR2(40 BYTE),
  WORK_CODE    VARCHAR2(40 BYTE),
  VENDOR_CODE  VARCHAR2(40 BYTE),
  LOAN_NUMBER  VARCHAR2(40 BYTE),
  QC_SEGMENT   VARCHAR2(40 BYTE),
  WORKING      NUMBER,
  COMPLETED    DATE,
  LOAD_DATE    DATE,
  FILE_ID      NUMBER
)
/

CREATE TABLE RDM.SQA_QC_MASTER_STG
(
  CLIENT        VARCHAR2(40 BYTE),
  LOAN_TYPE     VARCHAR2(40 BYTE),
  WORK_CODE     VARCHAR2(40 BYTE),
  VENDOR_CODE   VARCHAR2(40 BYTE),
  LOAN_NUMBER   VARCHAR2(40 BYTE),
  ORDER_NUMBER  VARCHAR2(40 BYTE),
  QC_SEGMENT    VARCHAR2(40 BYTE)
)
/

CREATE TABLE RDM.SQA_QC_QUESTION_REPLY
(
  PID             NUMBER,
  QUESTION_SET    NUMBER,
  ACTIVE          NUMBER,
  QUESTION_REPLY  VARCHAR2(300 BYTE)
)
/

CREATE TABLE RDM.SQA_QC_QUESTION_SETS
(
  PID           NUMBER,
  QUESTION_SET  VARCHAR2(200 BYTE)
)
/

CREATE TABLE RDM.SQA_QC_SECURITY_LEVELS
(
  LOGIN              VARCHAR2(40 BYTE),
  USER_ID            NUMBER,
  QC_SECURITY_LEVEL  NUMBER,
  PID                NUMBER
)
/

CREATE OR REPLACE TRIGGER RDM.SQA_QC_SECURITY_LEVELS_BI
BEFORE INSERT ON RDM.SQA_QC_SECURITY_LEVELS
FOR EACH ROW
DECLARE
  P_ID       number;
BEGIN

        SELECT RDM.SQA_QC_SECURITY_LEVELS_SEQ.NEXTVAL
        INTO P_ID
        FROM DUAL; 
                
        :new.PID := P_ID;

END;
/

show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_QUESTION_SETS_BI
BEFORE INSERT ON RDM.SQA_QC_QUESTION_SETS
FOR EACH ROW
DECLARE
  P_ID       number;
BEGIN

        SELECT RDM.SQA_QC_QUESTION_SETS_SEQ.NEXTVAL
        INTO P_ID
        FROM DUAL; 
                
        :new.PID := P_ID;

END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_QUESTION_REPLY_BI
BEFORE INSERT ON RDM.SQA_QC_QUESTION_REPLY
FOR EACH ROW
DECLARE
  P_ID       number;
BEGIN

        SELECT RDM.SQA_QC_QUESTION_REPLY_SEQ.NEXTVAL
        INTO P_ID
        FROM DUAL; 
                
        :new.PID := P_ID;

END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_MASTER_STG_BI
BEFORE INSERT ON RDM.SQA_QC_MASTER_STG
FOR EACH ROW
DECLARE
 P_QC_SEGMENT VARCHAR2(100 BYTE);
 
BEGIN
        
        P_QC_SEGMENT := CASE WHEN :NEW.LOAN_TYPE IN ('FMC','REO') THEN 'REO'
                        ELSE 'P&P' 
                        END;
                             
       :new.QC_SEGMENT := P_QC_SEGMENT;

END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_MASTER_BI
BEFORE INSERT ON RDM.SQA_QC_MASTER
FOR EACH ROW
DECLARE
  P_ID       number;
  p_load     date;
BEGIN

        SELECT SQA_QC_MASTER_SEQ.NEXTVAL, trunc(sysdate)
        INTO P_ID,p_load
        FROM DUAL;

       :new.PID := P_ID;
       :new.load_date := p_load;
       
         
END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_LOAN_CLIENT_STG_BI
BEFORE INSERT ON RDM.SQA_QC_LOAN_CLIENT_STG
FOR EACH ROW
DECLARE
  P_LOAD_ID       number;
BEGIN

        SELECT SQA_QC_LOAN_CLIENT_SEQ.NEXTVAL
        INTO P_LOAD_ID
        FROM DUAL;

        :new.LOAD_ID := P_LOAD_ID;
      

END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_JOB_TITLES_BI
BEFORE INSERT ON RDM.SQA_QC_JOB_TITLES
FOR EACH ROW
DECLARE
  P_ID       number;
  p_create    date;
BEGIN

        SELECT SQA_QC_JOB_TITLES_SEQ.NEXTVAL, trunc(sysdate)
        INTO P_ID,p_create
        FROM DUAL;

       :new.PID := P_ID;
       :new.CREATED_DATE := p_create;
       
         
END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_HR_REPORT_STG_BI
BEFORE INSERT
ON RDM.SQA_QC_HR_REPORT_STG
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
  P_LOAD_ID   NUMBER;

BEGIN

    IF ( :new.LOAD_ID is null)
    THEN
        SELECT SQA_QC_HR_REPORT_STG_SEQ.NEXTVAL
        INTO P_LOAD_ID
        FROM DUAL;

        :new.LOAD_ID := P_LOAD_ID;

    END IF;


END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_FILE_TYPES_BI
BEFORE INSERT
ON RDM.SQA_QC_FILE_TYPES
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
  P_ID       NUMBER;
BEGIN

    IF ( :new.PID is null)
    THEN
        SELECT SQA_QC_FILE_TYPES_SEQ.NEXTVAL
        INTO P_ID
        FROM DUAL;

        :new.PID := P_ID;

    END IF;


END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_FILES_LIST_BI
BEFORE INSERT
ON RDM.SQA_QC_FILES_LIST
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
  P_ID       NUMBER;
  P_DATE     DATE;
BEGIN

    IF ( :new.PID is null)
    THEN
        SELECT SQA_ICC_FILES_LIST_SEQ.NEXTVAL, SYSDATE
        INTO P_ID, P_DATE
        FROM DUAL;

        :new.PID := P_ID;
        :new.load_date := p_date;

    END IF;


END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_EMPLS_BI
BEFORE INSERT ON RDM.SQA_QC_EMPLS
FOR EACH ROW
DECLARE
  P_ID       number;  
  P_DATE     DATE;
BEGIN

        SELECT RDM.SQA_QC_EMPLS_SEQ.NEXTVAL, TRUNC(SYSDATE)
        INTO P_ID, P_DATE
        FROM DUAL; 
                
        :new.PID := P_ID;   
        :new.DATA_DATE := P_DATE; 
        

END;
/
show errors;


CREATE OR REPLACE TRIGGER RDM.SQA_QC_DETAILS_BI
BEFORE INSERT ON RDM.SQA_QC_DETAILS
FOR EACH ROW
DECLARE
  P_ID       number;
  p_start    date;
BEGIN

        SELECT SQA_QC_DETAILS_SEQ.NEXTVAL, sysdate
        INTO P_ID, p_start
        FROM DUAL;

       :new.PID        := P_ID;
       :new.START_DATE := p_start;
       :new.working    := 1;
END;
/
show errors;

CREATE OR REPLACE FORCE VIEW RDM.SQA_QC_MASTER_VW
(
   PID,
   CLIENT,
   LOAN_TYPE,
   WORK_CODE,
   VENDOR_CODE,
   LOAN_NUMBER,
   QC_SEGMENT,
   WORKING,
   COMPLETED
)
AS
     SELECT PID,
            CLIENT,
            LOAN_TYPE,
            WORK_CODE,
            VENDOR_CODE,
            LOAN_NUMBER,
            QC_SEGMENT,
            WORKING,
            COMPLETED
       FROM SQA_QC_MASTER
      WHERE NVL (WORKING, 0) = 0
   ORDER BY LOAD_DATE;




Insert into RDM.SQA_QC_EMPLS
   (LOGIN, DATA_DATE, STATUS, PID, EMAILADDRESS)
 Values
   ('christian.gardner', TO_DATE('04/03/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), 1, 3, 'christian.gardner@safeguardproperties.com');
COMMIT;

SET DEFINE OFF;
Insert into RDM.SQA_QC_FILE_TYPES
   (PID, FILE_TYPE, LOAD_PAGE_NO, REPORT_PAGE_ITEM, REPORT_PAGE_NO, 
    LOAD_PAGE_ITEM)
 Values
   (1, 'SQA QC Loan Client ', 735, 'P740_FILE_ID', 740, 
    'P735_FILE_ID');
Insert into RDM.SQA_QC_FILE_TYPES
   (PID, FILE_TYPE, LOAD_PAGE_NO, REPORT_PAGE_ITEM, REPORT_PAGE_NO, 
    LOAD_PAGE_ITEM)
 Values
   (2, 'HR Report', 745, 'P750_FILE_ID', 750, 
    'P745_FILE_ID');
COMMIT;

SET DEFINE OFF;
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (2, 'Client Operations Specialist', 'Client Operations Specialist', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (3, 'Client Account Representative', 'Client Account Representative', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (4, 'Convey Specialist', 'Convey Specialist', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (9, 'Extensions Specialist  ', 'Extensions Specialist  ', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (10, 'Insurance Settlement Specialist', 'Insurance Settlement Specialist', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (11, 'Order Entry Coordinator', 'Order Entry Coordinator', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (1, 'Bid Desk Specialist', 'Bid Desk Specialist', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (5, 'Aged Specialist', 'Aged Specialist', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (6, 'Estimators', 'Estimators', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (7, 'Repair Updaters', 'Repair Updaters', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (8, 'Investor Compliance Specialist', 'Investor Compliance Specialist', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (12, 'P&P Specialist', 'P&P Specialist', 1, TO_DATE('03/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (13, 'Client Account Representative', 'Client Account Rep', 1, TO_DATE('03/31/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (16, 'Investor Compliance Specialist', 'Investor Compliance Spec', 1, TO_DATE('03/31/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (18, 'Repair Updaters', 'Repair Updater', 1, TO_DATE('03/31/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (14, 'Estimators', 'Estimator', 1, TO_DATE('03/31/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (15, 'Insurance Settlement Specialist', 'Insurance Settlement Spec', 1, TO_DATE('03/31/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into RDM.SQA_QC_JOB_TITLES
   (PID, JOB_TITLE, JOB_NAMES, ACTIVE, CREATED_DATE)
 Values
   (17, 'Order Entry Coordinator', 'Order Entry Coord', 1, TO_DATE('03/31/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
COMMIT;


SET DEFINE OFF;
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (2, 1, 1, 'Adverse Conditions');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (3, 1, 1, 'INSPNOWORK');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (6, 1, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (8, 2, 1, 'Scanned Denial');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (10, 2, 1, 'Auto Approval');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (13, 2, 1, 'Required Order');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (14, 2, 1, 'Approved Amount');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (15, 2, 1, 'Incorrect Vendor');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (16, 2, 1, 'Opened Unnecessary');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (19, 2, 1, 'Investor Guidelines');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (22, 3, 1, 'Allowable');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (26, 3, 1, 'ICCCHK Process');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (30, 4, 1, 'Allowable');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (33, 4, 1, 'Client Parameters');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (36, 4, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (37, 5, 1, 'Required Bid Not Submitted');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (39, 5, 1, 'Not A PP Issue');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (40, 5, 1, 'Description');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (41, 5, 1, 'Location');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (42, 5, 1, 'Dimensions');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (49, 6, 1, 'Add/Correct');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (50, 6, 1, 'New Damage');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (53, 6, 1, 'Photos');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (54, 6, 1, 'Maint Status');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (56, 6, 1, 'Add Damage');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (57, 6, 1, 'Correct Damage');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (58, 6, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (59, 6, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (60, 7, 1, 'Work Flow Remarks');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (61, 7, 1, 'Submitted In Error');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (63, 7, 1, 'Marked Valid In Error');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (64, 7, 1, 'Photos');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (65, 7, 1, 'Amount');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (66, 7, 1, 'Description');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (67, 7, 1, 'Denied In Error');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (68, 7, 1, 'Appealed In Error');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (69, 7, 1, 'Canceled In Error');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (70, 7, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (71, 7, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (72, 8, 1, 'Bid for Allowable');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (73, 8, 1, 'Bid Unn Amount');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (74, 8, 1, 'Bid is Unn');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (75, 8, 1, 'Missing Dimensions');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (76, 8, 1, 'Missing Photos');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (77, 8, 1, 'Poor Photos');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (78, 8, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (79, 8, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (80, 9, 1, 'Hardcoding ICC');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (81, 9, 1, 'Hardcoding Sump');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (82, 9, 1, 'Hardcoding Mobile');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (83, 9, 1, 'Secure Date');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (84, 9, 1, 'Winterization Date');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (85, 9, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (86, 9, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (87, 10, 1, 'Charged Client In Error');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (88, 10, 1, 'Client Not Charged');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (89, 10, 1, 'Vendor Paid In Error');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (90, 10, 1, 'Vendor Not Paid');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (91, 10, 1, 'Vendor Discount Error');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (92, 10, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (93, 10, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (94, 11, 1, 'Invoiced Too High');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (95, 11, 1, 'No Discount/ no POC');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (96, 11, 1, 'No POC');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (97, 11, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (98, 11, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (99, 12, 1, 'ICC Checklist');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (100, 12, 1, 'ICC Date');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (101, 12, 1, 'Extension Task');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (102, 12, 1, 'Extension Section');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (103, 12, 1, 'Car Task');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (104, 12, 1, 'Main Bucket');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (105, 12, 1, 'Documents');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (106, 12, 1, 'Order Escalation');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (107, 12, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (108, 12, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (4, 1, 1, 'Client Parameters');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (5, 1, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (7, 2, 1, 'OA Approval');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (9, 2, 1, 'Client Approval');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (11, 2, 1, 'Work Order Type');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (12, 2, 1, 'Due Date');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (17, 2, 1, 'Instructions');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (18, 2, 1, 'Client Parameters');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (20, 2, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (21, 2, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (23, 3, 1, 'Bids');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (24, 3, 1, 'Investor Guidelines');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (25, 3, 1, 'Client Parameters');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (27, 3, 1, 'Supporting/Labeled Photos');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (28, 3, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (29, 3, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (31, 4, 1, 'Bids');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (32, 4, 1, 'Investor Guidelines');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (34, 4, 1, 'Supporting/Labeled Photos');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (35, 4, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (38, 5, 1, 'Required Bid Not Appealed');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (43, 5, 1, 'Supporting Photos');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (44, 5, 1, 'Supporting Documents');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (45, 5, 1, 'Body of Statement');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (46, 5, 1, 'Denied');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (47, 5, 1, 'Fail Multiple');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (48, 5, 1, 'Pass');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (51, 6, 1, 'Worsening Damage');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (52, 6, 1, 'Attributes');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (55, 6, 1, 'Claim Status');
Insert into RDM.SQA_QC_QUESTION_REPLY
   (PID, QUESTION_SET, ACTIVE, QUESTION_REPLY)
 Values
   (62, 7, 1, 'Marked Invalid In Error');
COMMIT;

SET DEFINE OFF;
Insert into RDM.SQA_QC_SECURITY_LEVELS
   (LOGIN, USER_ID, QC_SECURITY_LEVEL, PID)
 Values
   ('christian.gardner', 3, 1, 1);
Insert into RDM.SQA_QC_SECURITY_LEVELS
   (LOGIN, USER_ID, QC_SECURITY_LEVEL, PID)
 Values
   ('christian.gardner', 3, 2, 4);
COMMIT;

SET DEFINE OFF;
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (2, 'Order Entry Components');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (4, 'Work Order Instruction Completion Vendor');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (5, 'Bid Submission/ Appeal/ Extension');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (7, 'SPI Glass Bid');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (9, 'Hardcoding/ Status Dates');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (11, 'Invoicing Accurate Vendor');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (1, 'Inspection review');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (3, 'Work Order Instruction Completion Auditor');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (6, 'SPI Glass Damage');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (8, 'Bids Vendor');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (10, 'Invoicing Accurate');
Insert into RDM.SQA_QC_QUESTION_SETS
   (PID, QUESTION_SET)
 Values
   (12, 'Archer/ CARCH/ SPI');
COMMIT;



spool off;
