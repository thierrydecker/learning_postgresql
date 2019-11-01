SELECT
    column_1,
    column_2
    FROM
        tbl_name_1
UNION
SELECT
    column_1,
    column_2
    FROM
        tbl_name_2;

CREATE TABLE sales2019q1
(
    name   CHAR(255)
        CONSTRAINT sales2019q1_pk
            PRIMARY KEY,
    amount NUMERIC(10, 2)
);

CREATE TABLE sales2019q2
(
    name   CHAR(255)
        CONSTRAINT sales2019q2_pk
            PRIMARY KEY,
    amount NUMERIC(10, 2)
);

INSERT
    INTO
        sales2019q1 (name,
                     amount)
    VALUES
        ('Mike', 150000.25),
        ('Jon', 132000.75),
        ('Mary', 100000);

INSERT
    INTO
        sales2019q2 (name,
                     amount)
    VALUES
        ('Mike', 120000.25),
        ('Jon', 142000.75),
        ('Mary', 100000);

SELECT *
    FROM
        sales2019q1;

SELECT *
    FROM
        sales2019q2;

SELECT *
    FROM
        sales2019q1
UNION ALL
SELECT *
    FROM
        sales2019q2;

SELECT *
    FROM
        sales2019q1
UNION ALL
SELECT *
    FROM
        sales2019q2
ORDER BY
    name ASC,
    amount DESC;

SELECT
    t.name,
    sum(t.amount)
    FROM
        (
            SELECT *
                FROM
                    sales2019q1
            UNION ALL
            SELECT *
                FROM
                    sales2019q2
            ORDER BY
                name ASC,
                amount DESC
        ) AS t
    GROUP BY
        t.name;