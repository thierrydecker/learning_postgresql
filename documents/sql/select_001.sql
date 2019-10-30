--
-- SELECT a single column FROM a table
--
SELECT
    first_name
    FROM
        customer;

--
-- SELECT multiple columns FROM a table
--
SELECT
    first_name,
    last_name,
    email
    FROM
        customer;

--
-- SELECT all columns FROM a table
--
SELECT *
    FROM
        customer;

--
-- SELECT statement with expression
--
SELECT
    first_name || ' ' || last_name AS full_name,
    email
    FROM
        customer;

SELECT 5 * 3 AS result;