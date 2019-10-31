SELECT *
    FROM
        T1
            CROSS JOIN T2;

SELECT *
    FROM
        T1
            INNER JOIN T2 ON TRUE;

CREATE TABLE T1
(
    label CHAR(1) PRIMARY KEY
);

CREATE TABLE T2
(
    score INT PRIMARY KEY
);

INSERT
    INTO
        T1 (label)
    VALUES
        ('A'),
        ('B');

INSERT
    INTO
        T2 (score)
    VALUES
        (1),
        (2),
        (3);

SELECT *
    FROM
        T1;

SELECT *
    FROM
        T2;

SELECT *
    FROM
        T1
            CROSS JOIN T2;