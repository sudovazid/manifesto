/*declare bq_record_count variable*/
DECLARE bq_record_count INT64 DEFAULT 0;

/* declare feed_record_count variable*/
DECLARE mfst_record_count INT64 DEFAULT 1;

SELECT COUNT(*) AS bq_record_count FROM `<project id>.stationary.board`;

SELECT SUM(RECORD_COUNT) AS mfst_record_count FROM `<project id>.stationary.tbl_mfst`
WHERE FILENAME = 'board';


IF bq_record_count = mfst_record_count THEN

  SELECT 'Records matching';

ELSE 

  SELECT 'Records not matching';

END IF;