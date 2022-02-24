/*
 * Compute the country with the most customers in it. 
 */

SELECT country.country
FROM country
JOIN city USING (country_id)
JOIN address USING (city_id)
JOIN customer USING (address_id)
GROUP BY country.country
ORDER BY COUNT(*) DESC
LIMIT 1;
