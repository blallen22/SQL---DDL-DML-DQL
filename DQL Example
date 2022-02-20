SELECT
  tg.name AS name,
  COUNT(tc.id) AS all_test_cases,
  SUM(CASE WHEN tc.status = 'OK' THEN 1 ELSE 0 END) AS passed_test_cases,
  SUM (CASE WHEN tc.status = 'OK' THEN tg.test_value ELSE 0 END) as total_value
FROM 
  test_cases AS tc
RIGHT JOIN 
  test_groups AS tg ON tg.name = tc.group_name
GROUP BY tg.name
ORDER BY total_value desc, name asc;
