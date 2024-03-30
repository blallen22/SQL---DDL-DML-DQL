WITH table_name AS (
	SELECT
		customer_id,
		variable_one,
		variable_two,
		SUM(variable_three) AS variable_three_sum
	FROM table
	GROUP BY 1, 2, 3
	ORDER BY 1, 2, 3
)

, row_number AS (
	SELECT
		customer_id,
		variable_one,
		variable_two,
		ROW_NUMBER() OVER (PARTITION BY customer_id, variable_one ORDER BY variable_two DESC) AS row_num
	FROM table_two
	GROUP BY 1, 2, 3
)

, max_var_two AS (
	SELECT
		MAX(variable_two) AS variable_two_max
	FROM table_name
)

, diff_max_current AS (
	SELECT
		r.customer_id,
		r.variable_one,
		(m.variable_two_max - r.variable_two) AS variable_two_diff
	FROM row_number AS r, max_var_two AS m
	WHERE r.row_num = 1
	GROUP BY 1, 2, 3
)

SELECT
	t.customer_id,
	t.variable_one,
	t.variable_two,
	t.variable_three,
	d.variable_two_diff,
	(CASE
		WHEN d.variable_two_diff >= 100 THEN 1
		ELSE 0
		END) AS variable_two_one_hundred_plus,
	(CASE
		WHEN d.variable_two_diff >= 200 THEN 1
		ELSE 0
		END) AS variable_two_two_hundred_plus
FROM table_name AS t
LEFT JOIN diff_max_current AS (d ON t.customer_id = d.customer_id AND t.variable_one = d.variable_one)
GROUP BY 1, 2, 3, 4, 5, 6, 7
ORDER BY 1, 2, 3
;
