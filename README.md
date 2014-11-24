centos-mysql-supervisor
=======================
docker pull aarongo/centos-ssh-supervisor

mysql-supervisor config
-----------------------
        [supervisord]
        nodaemon=true
        [program:sshd]
        command=/usr/sbin/sshd -D

        [program:mysqld]
        command=/etc/init.d/mysqld start

### start supervisor-mysql
    docker run -p 2222:22 -p 3306:3306 -it -v /mysqldata:/var/lib/mysql aarongo/centos-mysql-supervisor
###Attention
    The Dockerfile configuration VOLUME ["/mysqldata"] Is must
