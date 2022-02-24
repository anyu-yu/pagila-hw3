/*
 * Compute the number of customers who live outside of the US.
 */

SELECT COUNT(*) AS count
FROM customer
WHERE customer_id IN (
    SELECT DISTINCT customer.customer_id
    FROM customer
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
    WHERE NOT(country.country = 'US')
);
