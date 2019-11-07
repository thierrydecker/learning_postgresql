DELETE
  FROM table
 WHERE condition;

DELETE
  FROM table
      USING another_table
 WHERE table.id = another_table.id
   AND …

DELETE
  FROM table
 WHERE table.id = (SELECT id FROM another_table);

SELECT *
  FROM link;

DELETE
  FROM link
 WHERE id = 8;

SELECT *
  FROM link_tmp;

DELETE
  FROM link
      USING link_tmp
 WHERE link.id = link_tmp.id;

DELETE
  FROM link;

DELETE
  FROM link_tmp
RETURNING *;