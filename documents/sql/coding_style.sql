SELECT file_hash -- stored ssdeep hash
  FROM file_system
 WHERE file_name = '.vimrc';

/* Updating the file record after writing to the file */
UPDATE file_system
   SET file_modified_date = '1980-02-22 13:19:01.00000',
       file_size          = 209732
 WHERE file_name = '.vimrc';

SELECT first_name
  FROM staff;

SELECT first_name AS fn
  FROM staff         AS s1
       JOIN students AS s2
       ON s2.mentor_id = s1.staff_num;

SELECT SUM(s.monitor_tally) AS monitor_total
  FROM staff AS s;

SELECT model_num
  FROM phones AS p
 WHERE p.release_date > '2014-09-30';

(SELECT f.species_name,
        AVG(f.height)   AS average_height,
        AVG(f.diameter) AS average_diameter
   FROM flora AS f
  WHERE f.species_name = 'Banksia'
     OR f.species_name = 'Sheoak'
     OR f.species_name = 'Wattle'
  GROUP BY f.species_name, f.observation_date)

 UNION ALL

(SELECT b.species_name,
        AVG(b.height)   AS average_height,
        AVG(b.diameter) AS average_diameter
   FROM botanic_garden_flora AS b
  WHERE b.species_name = 'Banksia'
     OR b.species_name = 'Sheoak'
     OR b.species_name = 'Wattle'
  GROUP BY b.species_name, b.observation_date);

SELECT a.title, a.release_date, a.recording_date
  FROM albums AS a
 WHERE a.title = 'Charcoal Lane'
    OR a.title = 'The New Danger';

INSERT INTO albums (title, release_date, recording_date)
VALUES ('Charcoal Lane', '1990-01-01 01:01:01.00000', '1990-01-01 01:01:01.00000'),
       ('The New Danger', '2008-01-01 01:01:01.00000', '1990-01-01 01:01:01.00000');

UPDATE albums
   SET release_date = '1990-01-01 01:01:01.00000'
 WHERE title = 'The New Danger';

SELECT a.title,
       a.release_date,
       a.recording_date,
       a.production_date -- grouped dates together
  FROM albums AS a
 WHERE a.title = 'Charcoal Lane'
    OR a.title = 'The New Danger';

SELECT r.last_name
  FROM riders           AS r
       INNER JOIN bikes AS b
       ON r.bike_vin_num = b.vin_num
           AND b.engine_tally > 2

       INNER JOIN crew  AS c
       ON r.crew_chief_last_name = c.last_name
           AND c.chief = 'Y';

SELECT r.last_name,
       (SELECT MAX(YEAR(championship_date))
          FROM champions AS c
         WHERE c.last_name = r.last_name
           AND c.confirmed = 'Y') AS last_championship_year
  FROM riders AS r
 WHERE r.last_name IN
       (SELECT c.last_name
          FROM champions AS c
         WHERE YEAR(championship_date) > '2008'
           AND c.confirmed = 'Y');

SELECT CASE postcode
           WHEN 'BN1' THEN 'Brighton'
           WHEN 'EH1' THEN 'Edinburgh'
           END AS city
  FROM office_locations
 WHERE country = 'United Kingdom'
   AND opening_time BETWEEN 8 AND 9
   AND postcode IN ('EH1', 'BN1', 'NN1', 'KW1');

CREATE TABLE staff
(
    PRIMARY KEY (staff_num),
    staff_num      INT(5) NOT NULL,
    first_name     VARCHAR(100) NOT NULL,
    pens_in_drawer INT(2) NOT NULL,
    CONSTRAINT pens_in_drawer_range
        CHECK (pens_in_drawer >= 1 AND pens_in_drawer < 100)
);
