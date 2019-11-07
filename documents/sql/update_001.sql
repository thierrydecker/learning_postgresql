UPDATE table
   SET column1 = value1,
       column2 = value2, ...
       WHERE
       condition;

SELECT *
  FROM link;

UPDATE link
   SET last_update = DEFAULT
 WHERE last_update IS NULL;

UPDATE link
   SET rel = 'nofollow';

UPDATE link
   SET description = name;

SELECT *
  FROM link_tmp;

UPDATE link_tmp
   SET rel         = link.rel,
       description = link.description,
       last_update = link.last_update
  FROM link
 WHERE link_tmp.id = link.id;

   UPDATE link
      SET description = 'Learn PostgreSQL fast and easy',
          rel         = 'follow'
    WHERE id = 2
RETURNING id,
    description,
    rel;

SELECT *
  FROM link
 WHERE id = 2;