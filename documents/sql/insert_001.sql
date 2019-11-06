INSERT
    INTO
        table(column1, column2, …)
    VALUES
        (value1, value2, …);

INSERT
    INTO
        table (column1, column2, …)
    VALUES
        (value1, value2, …),
        (value1, value2, …), ...;

INSERT
    INTO
        table(column1, column2, ...)
SELECT
    column1,
    column2, ...
    FROM another_table
    WHERE
        condition;

CREATE TABLE link
(
    ID          serial PRIMARY KEY,
    url         VARCHAR(255) NOT NULL,
    name        VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    rel         VARCHAR(50)
);

INSERT
    INTO
        link (url, name)
    VALUES
        ('http://www.google.com', 'Google');

SELECT *
    FROM
        link;

INSERT
    INTO
        link (url, name)
    VALUES
        ('http://www.oreilly.com', 'O''Reilly Media');

INSERT
    INTO
        link (url, name)
    VALUES
        ('http://www.duckduckgo.com', 'DuckDuckGo'),
        ('http://www.yahoo.com', 'Yahoo'),
        ('http://www.bing.com', 'Bing');

ALTER TABLE link
    ADD COLUMN last_update DATE;

ALTER TABLE link
    ALTER COLUMN last_update
        SET DEFAULT CURRENT_DATE;

INSERT
    INTO
        link (url, name, last_update)
    VALUES
        ('http://www.facebook.com', 'Facebook', '2013-06-01');

INSERT
    INTO
        link (url, name, last_update)
    VALUES
        ('https://www.tumblr.com/', 'Tumblr', DEFAULT);

CREATE TABLE link_tmp
(
    LIKE link
);

INSERT
    INTO
        link_tmp
SELECT *
    FROM
        link
    WHERE
        last_update IS NOT NULL;

SELECT *
    FROM
        link_tmp;

INSERT
    INTO
        link (url, NAME, last_update)
    VALUES
        ('http://www.postgresql.org', 'PostgreSQL', DEFAULT)
    RETURNING id;