CREATE TABLE IF NOT EXISTS 'sakila_snowflake'.'fact_rental' (
'rental_id' INT(10) NOT NULL,
'rental_last_update' TIMESTAMP NOT NULL,
'customer_key' INT(8) NOT NULL,
'staff_key' INT(8) NOT NULL,
'film_key' INT(8) NOT NULL,
'store_key' INT(8) NOT NULL,
'rental_date_key' BIGINT(20),
'return_date_key' BIGINT(20),
'count_returns' INT(10) NOT NULL,
'count_rentals' INT(8) NOT NULL,
'rental_duration' INT(10) NOT NULL,
'dollar_amount' FLOAT,
PRIMARY KEY ('rental_id')
) ENGINE=InnoDB DEFAULT CHARSET-latin1;
