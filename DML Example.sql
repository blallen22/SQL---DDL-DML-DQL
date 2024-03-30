INSERT INTO sakila_snowflake.fact_rental (
  rental_id,
  rental_last_update,
  customer_key,
  staff_key,
  rental_date_key,
  return_date_key,
  film_key,
  rental_duration,
  store_key,
  count_returns,
  count_rentals,
  dollar_amount
)
(SELECT
  sakila.rental.rental.id,
  sakila.rental.last_update,
  sakila.rental.customer_id,
  sakila.rental.staff_id,
  saklia.rental.rental_date,
  sakila.rental.return_date,
  sakila.film.film_id,
  sakila.film.rental_duration,
  sakila.customer.store_id,
  IF(sakila.rental.return_date IS NOT NULL, 1, 0),
  IF(sakila.rental.return_date IS NOT NULL, 1, 0),
  (ABS(DATEDIFF(sakila.rental.return_date, sakila.rental.rental_date))*sakila.film.rental_rate)
FROM
  sakila.rental
INNER JOIN
  sakila.inventory ON sakila.rental.intentory_id = sakila.inventory.inventory_id
INNER JOIN
  sakila.film ON sakila.inventory.film_id = sakila.film.film_id
INNER JOIN
  sakila.customer ON sakila.rental.customer_id = sakila.customer.customer_id);
