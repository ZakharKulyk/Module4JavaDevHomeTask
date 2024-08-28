WITH project_durations AS (SELECT PROJECT_ID,
                                  CLIENT_ID,
                                  (YEAR(FINISH_DATE) - YEAR (START_DATE)) * 12 +
                                      MONTH (FINISH_DATE) - MONTH(START_DATE) +
        CASE
            WHEN DAY(FINISH_DATE) >= DAY(START_DATE) THEN 0
            ELSE -1
END
AS MONTH_COUNT
    FROM PROJECT
)
SELECT c.NAME,
       pd.MONTH_COUNT
FROM project_durations pd
         JOIN CLIENT c ON pd.CLIENT_ID = c.CLIENT_ID
WHERE pd.MONTH_COUNT = (SELECT MAX(MONTH_COUNT)
                        FROM project_durations)