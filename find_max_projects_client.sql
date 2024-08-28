SELECT NAME, PROJECT_COUNT
FROM (SELECT CLIENT.CLIENT_ID,
             SUBQUERY.PROJECT_COUNT,
             CLIENT.NAME
      FROM (SELECT CLIENT_ID, COUNT(PROJECT_ID) AS PROJECT_COUNT
            FROM PROJECT
            GROUP BY CLIENT_ID) AS SUBQUERY
               JOIN CLIENT ON CLIENT.CLIENT_ID = SUBQUERY.CLIENT_ID) AS FINAL_SUBQUERY
WHERE FINAL_SUBQUERY.PROJECT_COUNT =
      (SELECT COUNT(PROJECT_ID)
       FROM PROJECT
       GROUP BY CLIENT_ID
       ORDER BY COUNT(PROJECT_ID) DESC
    LIMIT 1
    )


