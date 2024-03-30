# OVER
SELECT 
  name, 
  weight, 
  AVG(weight) OVER(ORDER BY name) AS running_total
FROM 
  runners
ORDER BY 
  name;

# PARTITION BY
SELECT 
  name, 
  weight, 
  country, 
  AVG(weight) OVER(PARTITION BY country ORDER BY name)
FROM 
  runners
ORDER BY 
  name;

# PRECEDING and FOLLOWING
SELECT 
  name, 
  weight, 
  MIN(weight) OVER(ORDER BY name ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
FROM 
  runners
ORDER BY 
  name;

# UNBOUNDED PRECEDING
SELECT 
  name, 
  SUM(weight) OVER(ORDER BY weight DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_weight
FROM 
  cats
ORDER BY 
  running_total_weight;
