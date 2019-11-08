CREATE DATABASE db_name
    OWNER = role_name
    TEMPLATE = template
    ENCODING = ENCODING
    LC_COLLATE = COLLATE
    LC_CTYPE = ctype
    TABLESPACE = tablespace_name
    CONNECTION LIMIT = max_concurrent_connection

CREATE DATABASE hrdb
    WITH ENCODING ='UTF8'
    OWNER =hr
    CONNECTION LIMIT =25;