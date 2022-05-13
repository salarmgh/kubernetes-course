if [[ server-id -eq 1 ]]; then
    mysql -uroot -proot -e "CREATE USER 'replica_user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';"
    mysql -uroot -proot -e "GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';"
fi
