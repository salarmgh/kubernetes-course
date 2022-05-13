sleep 10
server_id=$(echo $HOSTNAME | cut -d- -f2)
if [[ server_id -eq 0 ]]; then
    mysql -uroot -proot -e "CREATE USER 'replica_user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';"
    mysql -uroot -proot -e "GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';"
    mysql -uroot -proot -e "flush privileges"
fi
