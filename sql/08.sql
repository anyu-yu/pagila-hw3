/*
 * The film 'BUCKET BROTHERHOOD' is your favorite movie, but you're tired of watching it.
 * You want to find something new to watch that is still similar to 'BUCKET BROTHERHOOD'.
 * To find a similar movie, you decide to search the history of movies that other people have rented.
 * Your idea is that if a lot of people have rented both 'BUCKET BROTHERHOOD' and movie X,
 * then movie X must be similar and something you'd like to watch too.
 * Your goal is to create a SQL query that finds movie X.
 * Specifically, write a SQL query that returns all films that have been rented by at least 3 customers who have also rented 'BUCKET BROTHERHOOD'.
 *
 * HINT:
 * This query is very similar to the query from problem 06,
 * but you will have to use joins to connect the rental table to the film table.
 *
 * HINT:
 * If your query is *almost* getting the same results as mine, but off by 1-2 entries, ensure that:
 * 1. You are not including 'BUCKET BROTHERHOOD' in the output.
 * 2. Some customers have rented movies multiple times.
 *    Ensure that you are not counting a customer that has rented a movie twice as 2 separate customers renting the movie.
 *    I did this by using the SELECT DISTINCT clause.
 */

WITH inv AS (
    SELECT *
    FROM inventory
    JOIN rental USING (inventory_id)
)

SELECT DISTINCT f1.title
FROM film f1
JOIN inv i1 ON (f1.film_id = i1.film_id)
JOIN inv i2 ON (f1.film_id = i2.film_id)
JOIN inv i3 ON (f1.film_id = i3.film_id)
JOIN inv i4 ON (i1.customer_id = i4.customer_id)
JOIN inv i5 ON (i2.customer_id = i5.customer_id AND i4.film_id = i5.film_id)
JOIN inv i6 ON (i3.customer_id = i6.customer_id AND i4.film_id = i6.film_id)
JOIN film f2 ON (i4.film_id = f2.film_id)
WHERE NOT(i1.customer_id = i2.customer_id)
    AND NOT(i1.customer_id = i3.customer_id)
    AND NOT(i2.customer_id = i3.customer_id)
    AND f2.title = 'BUCKET BROTHERHOOD'
    AND NOT(f1.title = 'BUCKET BROTHERHOOD')
ORDER BY f1.title;
