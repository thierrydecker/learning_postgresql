# PostgreSQL `CUBE` sub-clause

## What you will learn

in this tutorial, you will learn how to use the PostgreSQL `CUBE` to generate multiple grouping sets.

## Introduction to the PostgreSQL `CUBE`

PostgreSQL `CUBE` is a sub-clause of the GROUP BY clause. 

The CUBE allows you to generate multiple grouping sets.

A grouping set is a set of columns to which you want to group. 

The following illustrates the syntax of the CUBE sub-clause:

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

In this syntax:

- First, specify the CUBE sub-clause in the the `GROUP BY` clause of the `SELECT` statement.
- Second, in the select list, specify the columns (dimensions or dimension columns) which you want to analyze and 
aggregation function expressions.
- Third, in the `GROUP BY` clause, specify the dimension columns within the parentheses of the `CUBE` sub-clause.

The query generates all possible grouping sets based on the dimension columns specified in CUBE. The CUBE sub-clause is 
a short way to define multiple grouping sets so the following are equivalent:

    CUBE(c1,c2,c3) 
     
    GROUPING SETS (
        (c1,c2,c3), 
        (c1,c2),
        (c1,c3),
        (c2,c3),
        (c1),
        (c2),
        (c3), 
        ()
     )

In general, if the number of columns specified in the `CUBE` is n, then you will have 2n combinations.

PostgreSQL allows you to perform a partial cube to reduce the number of aggregates calculated. 

The following shows the syntax:

    SELECT
        c1,
        c2,
        c3,
        aggregate (c4)
    FROM
        table_name
    GROUP BY
        c1,
        CUBE (c1, c2);
        
PostgreSQL CUBE examples

We will use the sales table created in the `GROUPING SETS` tutorial for the demonstration.

    SELECT *
        FROM
            sales;

![Cube 001](../images/cube_001.png)

The following query uses the `CUBE` sub-clause to generate multiple grouping sets:

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

And here is the output:

![Cube 002](../images/cube_002.png)

The following query performs a partial cube:

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

![Cube 003](../images/cube_003.png)

## What you have learned

In this tutorial, you have learned how to use the PostgreSQL `CUBE` to generate multiple grouping sets.