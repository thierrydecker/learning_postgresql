SELECT
    first_name || ' ' || last_name
    FROM
        customer
    ORDER BY
        first_name || ' ' || last_name;

SELECT
    first_name || ' ' || last_name AS full_name
    FROM
        customer
    ORDER BY
        full_name;

SELECT
    column_list
    FROM
        table_name AS alias_name;