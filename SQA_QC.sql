CREATE OR REPLACE PACKAGE RDM.SQA_QC
IS
TYPE GenRefCursor IS REF CURSOR;
TYPE JOB_TITLES IS RECORD
(
JOB_TITLE  DBMS_SQL.VARCHAR2_TABLE,
JOB_NAMES  DBMS_SQL.VARCHAR2_TABLE,
ACTIVE     DBMS_SQL.NUMBER_TABLE
);



FUNCTION GET_JOB_TITLE ( P_ALT_TITLE VARCHAR2 ) RETURN VARCHAR2;

PROCEDURE LOAD_QC_FILES(P_FILE_TYPE NUMBER);



end;
/
CREATE OR REPLACE PACKAGE BODY RDM.SQA_QC
IS

FUNCTION GET_JOB_TITLE ( P_ALT_TITLE VARCHAR2 ) RETURN VARCHAR2
IS

JOB_TITLE   VARCHAR2(100 BYTE);
SQL_STMT    VARCHAR2(100 BYTE);
CNT         NUMBER;
GC          GenRefCursor;
JT          JOB_TITLES;

BEGIN


SQL_STMT := 'SELECT JOB_TITLE, JOB_NAMES, ACTIVE FROM SQA_QC_JOB_TITLES WHERE ACTIVE = 1 AND  JOB_NAME = :A';

OPEN GC FOR SQL_STMT USING P_ALT_TITLE;

FETCH GC BULK COLLECT INTO JT.JOB_TITLE,
                           JT.JOB_NAMES,
                           JT.ACTIVE;

CNT := JT.JOB_TITLE.COUNT;

IF ( CNT = 0 )
   THEN
       JOB_TITLE := 'Job Title Unknown';
else
       JOB_TITLE := JT.JOB_TITLE(1);

END IF;

CLOSE GC;


RETURN JOB_TITLE;

END;

PROCEDURE LOAD_QC_FILES(P_FILE_TYPE NUMBER)
IS

/********************************************************************
    Process what has not been moved from stage to Work order lists
          SQA_LOV.LOAD_ICC_FILES;
 ******************************************************************/
CURSOR C1 (FILE_ID NUMBER)
IS
select PID, FILE_TYPE, FILE_NAME, RECORDCNT, LOAD_DATE, LOADED_BY, COMMENTS, BEGIN_LOAD_ID, END_LOAD_ID, LOADED
from  SQA_QC_FILES_LIST
WHERE LOADED = 0
 AND  FILE_TYPE = FILE_ID;


R1  C1%ROWTYPE;

GC          GenRefCursor;
SQL_STMT    VARCHAR2(32000 BYTE);
DEL_STMT    VARCHAR2(32000 BYTE);
UPD_STMT    VARCHAR2(32000 BYTE);
MSG         VARCHAR2(1000 BYTE);
cnt1        NUMBER(10);

/*

 */

BEGIN


OPEN C1( P_FILE_TYPE);
    LOOP
    FETCH C1 INTO R1;
    EXIT WHEN C1%NOTFOUND;

     IF ( P_FILE_TYPE IN (1) )
        THEN

      /*
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
)

        ASSIGN  PID to stage table ASSIGNING EACH RECORD To the File that was just loaded
      */
                  BEGIN
                      UPD_STMT := ' UPDATE SQA_QC_LOAN_CLIENT_STG set FILE_ID = :1 WHERE LOAD_ID BETWEEN :2 AND :3 ';

                      EXECUTE IMMEDIATE UPD_STMT USING  R1.PID, R1.BEGIN_LOAD_ID, R1.END_LOAD_ID;


                      COMMIT;

                      SQL_STMT := ' insert into SQA_QC_MASTER(LOAN_NUMBER, CLIENT, LOAN_TYPE, WORKING, FILE_ID)';
                      SQL_STMT := SQL_STMT||'  select A.LOAN_NUMBER, A.CLIENT_CODE, A.LOAN_TYPE,  0 AS WORKING, FILE_ID';
                      SQL_STMT := SQL_STMT||'  FROM    SQA_QC_LOAN_CLIENT_STG  A';
                      SQL_STMT := SQL_STMT||'  LEFT JOIN ( SELECT LOAN_NUMBER, CLIENT, LOAN_TYPE FROM SQA_QC_MASTER WHERE COMPLETED IS NULL ) B ';
                      SQL_STMT := SQL_STMT||' ON ( A.LOAN_NUMBER = B.LOAN_NUMBER  AND A.CLIENT_CODE = B.CLIENT AND A.LOAN_TYPE = B.LOAN_TYPE)';
                      SQL_STMT := SQL_STMT||' WHERE  A.LOAN_NUMBER NOT IN (''BEGIN'',''END'') ';
                      SQL_STMT := SQL_STMT||'   AND  B.LOAN_NUMBER IS NULL ';
                      SQL_STMT := SQL_STMT||'   AND  A.FILE_ID = :A';

                      EXECUTE IMMEDIATE SQL_STMT USING  R1.PID;

                           cnt1  := SQL%ROWCOUNT;


                    COMMIT;

                      /*


                      */

                              INSERT INTO BOA_PROCESS_LOG
                                          (
                                            PROCESS,
                                            SUB_PROCESS,
                                            ENTRYDTE,
                                            ROWCOUNTS,
                                            MESSAGE
                                          )
                              VALUES ( 'SQA_QC', 'LOAD_QC_FILES',SYSDATE, cnt1, 'from '||R1.FILE_NAME);
                              COMMIT;

                      /*
                         close out the queue record
                      */
                            UPDATE SQA_QC_FILES_LIST SET LOADED = 1, RECORDCNT = cnt1 WHERE PID = R1.PID;

                            COMMIT;

                            EXECUTE IMMEDIATE 'TRUNCATE TABLE SQA_QC_LOAN_CLIENT_STG DROP STORAGE';

                  EXCEPTION WHEN OTHERS THEN

                            UPDATE SQA_QC_FILES_LIST SET LOADED = 9, RECORDCNT = 0 WHERE PID = R1.PID;
                            COMMIT;
                            MSG   := SQLERRM;
                           SEND_EMAIL  (P_TEAM=>'RDM',P_FROM=>'SQA_QC.LOAD_QC_FILES',P_SUBJECT=>R1.FILE_NAME ,P_MESSAGE=>MSG );
                  END;
           END IF;

     IF ( P_FILE_TYPE IN (2) )
        THEN

      /*
      */
                  BEGIN

                      UPD_STMT := ' UPDATE SQA_QC_HR_REPORT_STG set FILE_ID = :1 WHERE LOAD_ID BETWEEN :2 AND :3 ';

                      EXECUTE IMMEDIATE UPD_STMT USING  R1.PID, R1.BEGIN_LOAD_ID, R1.END_LOAD_ID;


                      COMMIT;

                      EXECUTE IMMEDIATE 'TRUNCATE TABLE SQA_QC_HR_REPORT DROP STORAGE ';




                      SQL_STMT := ' insert into SQA_QC_HR_REPORT(EMPLOYEE_NAME, JOB_TITLE, HOME_DEPARTMENT, EMPLOYEE_MGMT, EMPLOYEE_TEAM_LEAD, FILE_ID, LOAD_ID)';
                      SQL_STMT := SQL_STMT||'  select A.EMPLOYEE_NAME, A.JOB_TITLE, A.HOME_DEPARTMENT, A.EMPLOYEE_MGMT, A.EMPLOYEE_TEAM_LEAD, A.FILE_ID, A.LOAD_ID';
                      SQL_STMT := SQL_STMT||'  FROM    SQA_QC_HR_REPORT_STG  A';
                      SQL_STMT := SQL_STMT||'  where   A.FILE_ID = :A';

                      EXECUTE IMMEDIATE SQL_STMT USING  R1.PID;

                           cnt1  := SQL%ROWCOUNT;


                    COMMIT;

                      /*


                      */

                              INSERT INTO BOA_PROCESS_LOG
                                          (
                                            PROCESS,
                                            SUB_PROCESS,
                                            ENTRYDTE,
                                            ROWCOUNTS,
                                            MESSAGE
                                          )
                              VALUES ( 'SQA_QC', 'LOAD_QC_FILES',SYSDATE, cnt1, 'from '||R1.FILE_NAME);
                              COMMIT;

                      /*
                         close out the queue record
                      */
                            UPDATE SQA_QC_FILES_LIST SET LOADED = 1, RECORDCNT = cnt1 WHERE PID = R1.PID;

                            COMMIT;

                            EXECUTE IMMEDIATE 'TRUNCATE TABLE SQA_QC_HR_REPORT_STG DROP STORAGE';

                  EXCEPTION WHEN OTHERS THEN

                            UPDATE SQA_QC_FILES_LIST SET LOADED = 9, RECORDCNT = 0 WHERE PID = R1.PID;
                            COMMIT;
                            MSG   := SQLERRM;
                            CNT1   := SQLCODE;

                            SEND_EMAIL  (P_TEAM=>'RDM',P_FROM=>'SQA_QC.LOAD_QC_FILES',P_SUBJECT=>R1.FILE_NAME ,P_MESSAGE=>MSG );

                              INSERT INTO BOA_PROCESS_LOG
                                          (
                                            PROCESS,
                                            SUB_PROCESS,
                                            ENTRYDTE,
                                            ROWCOUNTS,
                                            MESSAGE
                                          )
                              VALUES ( 'SQA_QC', 'LOAD_QC_FILES',SYSDATE, cnt1, MSG);
                              COMMIT;

                  END;
           END IF;

    END LOOP;
CLOSE C1;
exception
     when others then
          cnt1  := sqlcode;
           msg  := sqlerrm;

              INSERT INTO BOA_PROCESS_LOG
                    (
                      PROCESS,
                      SUB_PROCESS,
                      ENTRYDTE,
                      ROWCOUNTS,
                      MESSAGE
                    )
        VALUES ( 'SQA_LOV', 'LOAD_ICC_FILES', SYSDATE, cnt1, msg);
        COMMIT;


    SEND_EMAIL  (P_TEAM=>'RDM',P_FROM=>'SQA_LOV.LOAD_ICC_FILES',P_SUBJECT=>'Procedure issue' ,P_MESSAGE=>MSG );

END;


end;
/
