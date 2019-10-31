CREATE TABLE basket_a
(
    id    INT PRIMARY KEY,
    fruit VARCHAR(100) NOT NULL
);

CREATE TABLE basket_b
(
    id    INT PRIMARY KEY,
    fruit VARCHAR(100) NOT NULL
);

INSERT
    INTO
        basket_a (id, fruit)
    VALUES
        (1, 'Apple'),
        (2, 'Orange'),
        (3, 'Banana'),
        (4, 'Cucumber');

INSERT
    INTO
        basket_b (id, fruit)
    VALUES
        (1, 'Orange'),
        (2, 'Apple'),
        (3, 'Watermelon'),
        (4, 'Pear');

SELECT
    a.id,
    a.fruit
    FROM
        basket_a AS a;

SELECT
    b.id,
    b.fruit
    FROM
        basket_b AS b;

SELECT
    a.id    AS id_a,
    a.fruit AS fruit_a,
    b.id    AS id_b,
    b.fruit AS fruit_b
    FROM
        basket_a AS a
            INNER JOIN basket_b AS b ON a.fruit = b.fruit;

SELECT
    a.id    id_a,
    a.fruit fruit_a,
    b.id    id_b,
    b.fruit fruit_b
    FROM
        basket_a a
            LEFT JOIN basket_b b ON a.fruit = b.fruit;

SELECT
    a.id    id_a,
    a.fruit fruit_a,
    b.id    id_b,
    b.fruit fruit_b
    FROM
        basket_a a
            LEFT JOIN basket_b b ON a.fruit = b.fruit
    WHERE
        b.id IS NULL;

SELECT
    a.id    id_a,
    a.fruit fruit_a,
    b.id    id_b,
    b.fruit fruit_b
    FROM
        basket_a a
            RIGHT JOIN basket_b b ON a.fruit = b.fruit;

SELECT
    a.id    id_a,
    a.fruit fruit_a,
    b.id    id_b,
    b.fruit fruit_b
    FROM
        basket_a a
            RIGHT JOIN basket_b b ON a.fruit = b.fruit
    WHERE
        a.id IS NULL;

SELECT
    a.id    id_a,
    a.fruit fruit_a,
    b.id    id_b,
    b.fruit fruit_b
    FROM
        basket_a a
            FULL OUTER JOIN basket_b b ON a.fruit = b.fruit;

SELECT
    a.id    id_a,
    a.fruit fruit_a,
    b.id    id_b,
    b.fruit fruit_b
    FROM
        basket_a a
            FULL JOIN basket_b b ON a.fruit = b.fruit
    WHERE
         a.id IS NULL
      OR b.id IS NULL;