SELECT USER
FROM DUAL;

SELECT *
FROM PLAN;



SELECT *
FROM ADD_LOCATION
WHERE PL_CD = 'PLAN1';



SELECT PLANSEQ.nextval from dual;
SELECT LOCSEQ.nextval from dual;

CREATE SEQUENCE PLANSEQ
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE LOCSEQ
INCREMENT BY 1
START WITH 1;