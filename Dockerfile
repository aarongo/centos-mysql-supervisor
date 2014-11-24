FROM aarongo/centos-ssh-supervisor

MAINTAINER  aaron "aaron.docker@gmail.com"


RUN  yum install -y mysql-server mysql 
   
RUN /etc/init.d/mysqld start &&\  
    mysql -e "grant all privileges on *.* to 'root'@'%' identified by 'comall2014';"&&\  
    mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by 'comall2014';"&&\  
    mysql -u root -pcomall2014 -e "show databases;" 
COPY supervisord.conf /etc/supervisord.conf
VOLUME ["/mysqldata"]
EXPOSE 22 3306
CMD ["/usr/bin/supervisord"]
