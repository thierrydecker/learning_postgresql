SELECT
    c1,
    c2,
    c3,
    aggregate(c4)
    FROM
        table_name
    GROUP BY
        CUBE (
        c1, c2, c3);

SELECT *
    FROM
        sales;

SELECT
    brand,
    segment,
    SUM(quantity)
    FROM
        sales
    GROUP BY
        CUBE (
        brand, segment)
    ORDER BY
        brand,
        segment;

SELECT
    brand,
    segment,
    SUM(quantity)
    FROM
        sales
    GROUP BY
        brand,
        CUBE (
        segment)
    ORDER BY
        brand,
        segment;