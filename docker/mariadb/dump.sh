!/bin/bash
/usr/bin/mysqld_safe &
sleep 5
mysql -u root -e "CREATE DATABASE clouvir"
mysql -u root clouvir < /home/mysql/dump/clouvir.sql
