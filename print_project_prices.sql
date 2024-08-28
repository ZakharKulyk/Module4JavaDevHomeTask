SELECT p.project_id                                                          AS PROJECT_ID,
       ROUND(SUM(w.salary) * DATEDIFF('MONTH', p.start_date, p.finish_date)) AS PRICE
FROM project p
         JOIN
     project_worker pw ON p.project_id = pw.project_id
         JOIN
     worker w ON pw.worker_id = w.id
GROUP BY p.project_id, p.start_date, p.finish_date
ORDER BY PRICE DESC;