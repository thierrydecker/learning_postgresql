# PostgreSQL Debian installation

## Architecture

![Debian architecture](../images/debian_install/debian_architecture.png)

## 1) Set up `postgresql` virtual machine

The current tutorial is based on a Debian 10 (Buster) virtual machine.

The postgresql virtual machine, is running two NICs.

- The first one (`enp0s3`) is the primary interface and is set up as NAT interface in VirtualBox. This interface will 
give access to the Internet. Address will probably be `10.0.2.15`.

- The second one (`enp0s8`) is the secondary interface and is set up on a VirtualBox Host only network. This interface
will give the internal connectivity in the lab between the different virtual machines.

Carefully follow these steps to install the first virtual machine that will run the PostgreSQL database server.

### 1a) Initial configuration

![Debian install 001](../images/debian_install/debian_install_001.png)

![Debian install 002](../images/debian_install/debian_install_002.png)

![Debian install 003](../images/debian_install/debian_install_003.png)

![Debian install 004](../images/debian_install/debian_install_004.png)

![Debian install 005](../images/debian_install/debian_install_005.png)

![Debian install 006](../images/debian_install/debian_install_006.png)

![Debian install 007](../images/debian_install/debian_install_007.png)

![Debian install 008](../images/debian_install/debian_install_008.png)

![Debian install 009](../images/debian_install/debian_install_009.png)

>At the next step, configure your own user account: `tdecker` for me in this tutorial.
>
>This user account will be used for the rest of this tutorial.

![Debian install 010](../images/debian_install/debian_install_010.png)

![Debian install 011](../images/debian_install/debian_install_011.png)

![Debian install 012](../images/debian_install/debian_install_012.png)

![Debian install 013](../images/debian_install/debian_install_013.png)

![Debian install 014](../images/debian_install/debian_install_014.png)

![Debian install 015](../images/debian_install/debian_install_015.png)

![Debian install 016](../images/debian_install/debian_install_016.png)

![Debian install 017](../images/debian_install/debian_install_017.png)

![Debian install 018](../images/debian_install/debian_install_018.png)

![Debian install 019](../images/debian_install/debian_install_019.png)

![Debian install 020](../images/debian_install/debian_install_020.png)

![Debian install 021](../images/debian_install/debian_install_021.png)

![Debian install 022](../images/debian_install/debian_install_022.png)

![Debian install 023](../images/debian_install/debian_install_023.png)

![Debian install 024](../images/debian_install/debian_install_024.png)

![Debian install 025](../images/debian_install/debian_install_025.png)

![Debian install 026](../images/debian_install/debian_install_026.png)

![Debian install 027](../images/debian_install/debian_install_027.png)

![Debian install 028](../images/debian_install/debian_install_028.png)

![Debian install 029](../images/debian_install/debian_install_029.png)

### 1b) Setup network configuration

From the virtual machine console:

Connect as `root` user.

Install `sudo` application:

    apt update
    apt install sudo
    
Add your own user account to sudo group:

    sudo adduser <user_account> sudo
    
Set up the secondary interface to assign it it's IP address:

Edit the `interface` file.

    nano /etc/network/interface

and make it like this:

![Debian install 030](../images/debian_install/debian_install_030.png)

Restart networking service:

    systemctl restart networking

From now on, we will only use an `ssh` connection (with our own user account) from our host machine.

    root@postgresql:~# logout

### 1c) PostgreSQL installation

From your host machine, connect to your `postgresql` virtual machine via ssh, using your own user account.

![Debian install 031](../images/debian_install/debian_install_031.png)

    sudo apt update
    sudo apt install postgresql-11

Verify your installation:

    pg_isready

You should see:

![Debian install 032](../images/debian_install/debian_install_032.png)

    systemctl status progresql
    
![Debian install 033](../images/debian_install/debian_install_033.png)

### 1c) Securing and configuring PostgreSQL database engine

By default, PostgreSQL uses the concept of roles to manage database access permissions and database roles are 
conceptually completely separate from operating system users. 

A role can be a user or a group, and a role that has login right is called user.

A freshly initialized system always contains one predefined role called `postgres`, it has the same name as the 
operating system user account called postgres, which is used to access the `psql` (PostgreSQL shell) and other database 
programs.

The PostgreSQL system user account is not protected using a password, to secure it, you can create a password using the 
`passwd` utility.

    sudo passwd postgres
    
![Debian install 034](../images/debian_install/debian_install_034.png)

Also, the `postgres` role (or administrative database user if you like) is not secured by default. 

You also need to secure it with a password. 

Now switch to the postgres system user account and postgres role (remember to set a strong and secure password) as 
shown.

    sudo -u postgres psql
    
![Debian install 035](../images/debian_install/debian_install_035.png)

You are now connected to the PostgreSQL shell.

Issue the following commands to assign a password to `postgres` role and quit the shell:

    \password
    \q

![Debian install 036](../images/debian_install/debian_install_036.png)

For now, your PostgreSQL engine is configured like this:

- postgres system account has a password set
- postgres database role has a password set
- PostgreSQL engine only accepts connections from local

We need to go further and make it:

- Accept connections from network
- Request passwords for roles connections

Two configuration file will have to be modified: 

- postgresql.conf
- pg_hba.conf 

The directory for these files is `/etc/postgresql/11/main`.

First, let's make a backup of these two files:

    cd /etc/postgresql/11/main
    sudo mv postgresql.conf postgresql.conf.backup
    sudo mv pg_hba.conf pg_hba.conf.backup
    ls -al
    
![Debian install 037](../images/debian_install/debian_install_037.png)

Now create the pg_hba.conf file:

    sudo nano pg_hba.conf

 and make it like this:
    
    #
    # Records structure
    #
    # TYPE  DATABASE        USER            ADDRESS                 METHOD
    #
    
    
    #
    # Database administrative login by Unix domain socket
    #
    local	all		postgres				md5
    
    #
    # IPv4 local connections
    #
    host	all		postgres	0.0.0.0/0		md5


Then create the postgresql.conf:

    sudo nano postgresql.conf
    
 and make it like this:
 
    #
    # Files locations
    #
    data_directory = '/var/lib/postgresql/11/main'
    hba_file = '/etc/postgresql/11/main/pg_hba.conf'
    ident_file = '/etc/postgresql/11/main/pg_ident.conf'
    external_pid_file = '/var/run/postgresql/11-main.pid'
    
    #
    # Connections and Authentications
    #
    listen_addresses = '*'
    port = 5432
    max_connections = 100
    unix_socket_directories = '/var/run/postgresql'
    
    #
    # SSL
    #
    ssl = on
    ssl_cert_file = '/etc/ssl/certs/ssl-cert-snakeoil.pem'
    ssl_key_file = '/etc/ssl/private/ssl-cert-snakeoil.key'
    
    #
    # Memory
    #
    shared_buffers = 128MB			# min 128kB
    dynamic_shared_memory_type = posix	# the default is the first option
    
    #
    # Checkpoints
    #
    max_wal_size = 1GB
    min_wal_size = 80MB
    
    #
    # Logging
    #
    log_line_prefix = '%m [%p] %q%u@%d '
    log_timezone = 'Europe/Paris'
    
    #
    # Process title
    #
    cluster_name = '11/main'
    
    #
    # Statistics
    #
    stats_temp_directory = '/var/run/postgresql/11-main.pg_stat_tmp'
    
    #
    # Locale and Formatting
    #
    datestyle = 'iso, dmy'
    timezone = 'Europe/Paris'
    
    #
    # default configuration for text search
    #
    default_text_search_config = 'pg_catalog.french'
    
    #
    # Config file includes
    #
    include_dir = 'conf.d'

As these two configuration files were created with `root` permissions, we need to assign them to `postgres` system 
account:

    sudo chown postgres:postgres *

Now restart the PostgreSQL service and verify it's started:

    sudo systemctl restart postgresql
    sudo systemctl status postgresql
    pg_isready
    
![Debian install 038](../images/debian_install/debian_install_038.png)

Let's finalize this installation by trying to connect to PostgreSQL:

    sudo -u postgres psql
    
and then quit the PostgreSQL shell.

    \q

![Debian install 039](../images/debian_install/debian_install_039.png)

The final step of verification is to try to connect to your PostgreSQL engine from a remote location (your host).

Exit your ssh session and connect to your PostgreSQL server with the following commands:

    psql -U postgres -h 172.16.1.110
    \q
    
![Debian install 040](../images/debian_install/debian_install_040.png)

If the PostgreSQL client is not installed on you host machine, you can try the previous commands directly from your 
PostgreSQL server.

![Debian install 041](../images/debian_install/debian_install_041.png)

## 2) Set up the `pgadmin` virtual machine

### 2a and b) Install the Debian base system the same way you did the `postgresql` virtual machine.

Follow the same steps (until the end of step `1b`), being careful with the name of the virtual machine that has to be 
`pgadmin` and with the IP address that to be set up with `172.16.1.111` on the enp0s8 interface.

![Debian install 042](../images/debian_install/debian_install_042.png)

![Debian install 043](../images/debian_install/debian_install_043.png)

### 2c) Install `pgadmin` virtual machine

From your host machine, connect to your `pgadmin` virtual machine via ssh, using your own user account.

![Debian install 044](../images/debian_install/debian_install_044.png)

Next, issue the following commands:

    sudo apt update
    sudo apt install curl ca-certificates gnupg
    su root
    curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    exit

Then create a file named `/etc/apt/sources.list.d/pgdg.list`:

    sudo nano /etc/apt/sources.list.d/pgdg.list   

and add the following line in the file:

    deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main
    
Save the changes and exit the file.

Now update the `apt` package cache (which is a mandatory step), and install the `pgadmin4` package as follows. 

The `pgadmin4-apache2` package is the `WSGI` application.

    sudo apt update
    sudo apt install pgadmin4 pgadmin4-apache2
    
During the package installation, you will be asked to set an email address for the pgAdmin web interface initial user 
account. 

This email will work as the account name, provide it and press `Enter`.

![Debian install 045](../images/debian_install/debian_install_045.png)

You will also be asked to set a password for the pgadmin4 initial user account. 

Provide a secure and strong password, then click Enter to proceed.

![Debian install 046](../images/debian_install/debian_install_046.png)

Once the packages are installed, the installer activates `systemd` to start the Apache2 service and enables it to 
automatically start at system startup, every time the system is rebooted.

You can check the status of the service with the following command to ensure that it is up and running.

    sudo systemctl status apache2
    
![Debian install 047](../images/debian_install/debian_install_047.png)

Now you can access the `pgAdmin4` web interface. 

Open a web browser and point it to the following address and click Enter.

    http://172.16.1.111/pgadmin4/
    
![Debian install 048](../images/debian_install/debian_install_048.png)

Once the `pgAdmin4` web login interface appears, enter the email address and password that you set earlier on to 
authenticate. Then click Login.

![Debian install 049](../images/debian_install/debian_install_049.png)

![Debian install 050](../images/debian_install/debian_install_050.png)

Then add the new server connection name and a comment. 

Click on the Connection Tab to provide the connection details I.e hostname, database name, database username, and 
password as shown in the following screen shots.

![Debian install 051](../images/debian_install/debian_install_051.png)

![Debian install 052](../images/debian_install/debian_install_052.png)

![Debian install 053](../images/debian_install/debian_install_053.png)

Once you are done, click Save.

![Debian install 054](../images/debian_install/debian_install_054.png)

So, here is the conclusion of this tutorial.