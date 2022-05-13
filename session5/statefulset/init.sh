echo "[mysqld]" > /etc/my.cnf.d/server_id.cnf
echo server-id = $(echo "$(echo $HOSTNAME | cut -d- -f2) + 1" | bc) >> /etc/my.cnf.d/server_id.cnf
echo "log_bin = /var/lib/mysql/mysql-bin.log" >> /etc/my.cnf.d/repl.cnf

if [[ server-id -eq 1 ]]; then
    mysql -uroot -proot -e "CREATE USER 'replica_user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';"
    mysql -uroot -proot -e "GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';"
fi
