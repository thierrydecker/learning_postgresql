SELECT
    column_list
    FROM
        A
    WHERE
        condition_a
        EXCEPT
SELECT
    column_list
    FROM
        B
    WHERE
        condition_b;

SELECT
    film_id,
    title
    FROM
        film
    ORDER BY
        title;

SELECT DISTINCT
    inventory.film_id,
    title
    FROM
        inventory
            INNER JOIN film ON film.film_id = inventory.film_id
    ORDER BY
        title;

SELECT
    film_id,
    title
    FROM
        film
        EXCEPT
SELECT DISTINCT
    inventory.film_id,
    title
    FROM
        inventory
            INNER JOIN film ON film.film_id = inventory.film_id
    ORDER BY
        title;