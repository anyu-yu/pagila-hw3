/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT DISTINCT film.title
FROM film
JOIN film_actor fa0 ON (film.film_id = fa0.film_id)
JOIN film_actor fa1 ON (fa0.film_id = fa1.film_id)
WHERE fa0.actor_id IN (
    SELECT DISTINCT film_actor.actor_id
    FROM film_actor
    JOIN film USING (film_id)
    WHERE film.title = 'AMERICAN CIRCUS'
)
AND fa1.actor_id IN (
    SELECT DISTINCT film_actor.actor_id
    FROM film_actor
    JOIN film USING (film_id)
    WHERE film.title = 'AMERICAN CIRCUS'
)
AND NOT(fa1.actor_id = fa0.actor_id)
ORDER BY film.title;
