# PostgreSQL Tips and Tricks

## Execute a SQL script file with PSql

    psql -U <user_name> -h <host> -f <script_name>
    
## Editing PostgreSQL prompt

By editing the user `.psqlrc` file you can customize the main `psql` prompt (`PROMPT1`).
 
Edit the `.psqlrc` file with the editor of your choice to add the following lines (here we’ll use nano).

    nano .psqlrc

and put this command in it:    

    set PROMPT1 '%[%033[1;33m%][%M:%>]%[%033[1;37m%] %[%033[1;34m%]%n@%/%R%#%x %[%033[1;37m%]'
    
This configuration file will give you the following prompt:

![Tricks 001](../images/tricks_001.png)

- %M refers to the database server’s hostname – is “[local]” if the connection is over a Unix domain socket
- %> refers to the listening port
- %n refers to the session username
- %/ refers the current database
- %R refers to whether you’re in single-line mode (^) or disconnected (!) but is normally =
- %# refers to whether you’re a superuser (#) or a regular user (>)
- %x refers to the transaction status – usually blank unless in a transaction block (*)
