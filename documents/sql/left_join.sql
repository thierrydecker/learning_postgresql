SELECT
    A.pka,
    A.c1,
    B.pkb,
    B.c2
    FROM
        A
            LEFT JOIN B ON A.pka = B.fka;

SELECT
    film.film_id,
    film.title,
    inventory_id
    FROM
        film
            LEFT JOIN inventory ON inventory.film_id = film.film_id;

SELECT
    film.film_id,
    film.title,
    inventory_id
    FROM
        film
            LEFT JOIN inventory ON inventory.film_id = film.film_id
    WHERE
        inventory.film_id IS NULL;