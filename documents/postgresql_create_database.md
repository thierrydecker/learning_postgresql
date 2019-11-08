# PostgreSQL `CREATE DATABASE` Statement

## What you will learn

In this tutorial, you will learn how to create new databases with various options by using the PostgreSQL 
`CREATE DATABASE` statement.

## Introduction to PostgreSQL `CREATE DATABASE` statement

To create a new PostgreSQL database, you use `CREATE DATABASE` statement as shown below:

    CREATE DATABASE db_name
        OWNER = role_name
        TEMPLATE = template
        ENCODING = ENCODING
        LC_COLLATE = COLLATE
        LC_CTYPE = ctype
        TABLESPACE = tablespace_name
        CONNECTION LIMIT = max_concurrent_connection
        
The `CREATE DATABASE` statement provides you with various options when creating a new database. 

Let’s examine those options in more detail:

- `db_name`: is the name of the new database that you want to create. The database name must be unique in the PostgreSQL 
database server. If you try to create a new database that has the same name as an existing database, PostgreSQL will 
issue an error.

- `role_name`: is the role name of the user who will own the new database. PostgreSQL uses user’s role name who executes 
the `CREATE DATABASE` statement as the default role name.

- `template`: is the name of the database template from which the new database creates. PostgreSQL allows you to create 
a database based on a template database. The template1 is the default template database.

- `encoding`: specifies the character set encoding for the new database. By default, it is the encoding of the template 
database.

- `collate`: specifies a collation for the new database. The collation specifies the sort order of strings that affect 
the result of the `ORDER BY` clause in the SELECT statement. The template database’s collation is the default collation 
for the new database if you don’t specify it explicitly in the `LC_COLLATE` parameter.

- `ctype`: specifies the character classification for the new database. The `ctype` affects the categorization e.g., 
digit, lower and upper. The default is the character classification of the template database.

- `tablespace_name`: specifies the tablespace name for the new database. The default is the template database’s 
tablespace.

- `max_concurrent_connection`: specifies the maximum concurrent connections to the new database. The default is -1 i.e., 
unlimited. This feature is very useful in the shared hosting environments where you can configure the maximum concurrent 
connections for a particular database.

Besides the `CREATE DATABASE` statement, you can also use the `createdb` program to create a new database. 

The `createdb` program uses `CREATE DATABASE` statement behind the scenes.

## PostgreSQL create database examples

The simplest way to create a new database is to use all default settings and only specify the database name as the 
following query:

    CREATE DATABASE testdb1;
    
PostgreSQL created a new database named `testdb1` that has default parameters from the default template database i.e., 
template1.

The following statement creates a new database name hrdb with the following parameters:

- Encoding: `utf-8`.
- Owner: `hr`, with the assumption that the hr user exists in the database server.
- Maximum concurrent connections: 25.

    CREATE DATABASE hrdb
        WITH ENCODING ='UTF8'
        OWNER =hr
        CONNECTION LIMIT =25;

![Create Database 001](../images/create_database.png)