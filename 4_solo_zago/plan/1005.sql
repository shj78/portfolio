
SELECT
    PL_CD
    , MEM_CD
    , THEM_CD
    , PL_TT
    , PL_STT
    , PL_STRT_DT
    , PL_END_DT
    , PL_IMG
    , PL_HITS
    , PL_DT
    , PL_PPL
    , PL_BUD
    , OPEN_CD
FROM PLAN
WHERE PL_CD = '41';

SELECT
    LOC_CD
    , PL_CD
    , LOC_NM
    , CITY_CD
    , LOC_LAT
    , LOC_LONG
    , LOC_DESC
    , LOC_STRT_TIME
    , LOC_END_TIME
    , LOC_TRF_CONT
FROM ADD_LOCATION
WHERE PL_CD = '81';



SELECT
    PL_CD
    , MEM_CD
    , THEM_CD
    , PL_TT
    , PL_STT
    , TO_CHAR(PL_STRT_DT, 'YYYY/MM/DD') AS PL_STRT_DT
    , TO_CHAR(PL_END_DT, 'YYYY/MM/DD') AS PL_END_DT
    , PL_IMG
    , PL_HITS
    , PL_DT
    , PL_PPL
    , PL_BUD
    , OPEN_CD
FROM PLAN
WHERE PL_CD = '41';

select * from add_location;




