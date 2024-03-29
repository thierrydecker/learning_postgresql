SELECT
    ROUND(AVG(length), 2) avg_length
    FROM
        film
    GROUP BY
        rating
    ORDER BY
        avg_length DESC;

SELECT
    film_id,
    title,
    length
    FROM
        film
    WHERE
            length > ALL (
            SELECT
                ROUND(AVG(length), 2)
                FROM
                    film
                GROUP BY
                    rating
        )
    ORDER BY
        length;