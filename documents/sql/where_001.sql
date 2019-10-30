SELECT
    select_list
    FROM
        table_name
    WHERE
        condition;

SELECT
    last_name,
    first_name
    FROM
        customer
    WHERE
        first_name = 'Jamie';

SELECT
    last_name,
    first_name
    FROM
        customer
    WHERE
          first_name = 'Jamie'
      AND last_name = 'Rice';

SELECT
    first_name,
    last_name
    FROM
        customer
    WHERE
         last_name = 'Rodriguez'
      OR first_name = 'Adam';

SELECT
    first_name,
    last_name
    FROM
        customer
    WHERE
        first_name IN ('Ann', 'Anne', 'Annie');

SELECT
    first_name,
    last_name
    FROM
        customer
    WHERE
        first_name LIKE 'Ann%'