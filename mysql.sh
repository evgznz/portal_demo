#!/bin/bash
set -e

export root_user=root
export root_pass=pass

export user=user 
export pass=pass 

function create_db {

echo "Function CREATE_DB()"
mysql -u$root_user -p$root_pass -e "SHOW DATABASES" 
mysql -u$root_user -p$root_pass -e " create database renom_development CHARACTER SET utf8 COLLATE  utf8_general_ci"
mysql -u$root_user -p$root_pass -e " create database renom_test CHARACTER SET utf8 COLLATE  utf8_general_ci"
mysql -u$root_user -p$root_pass -e " create database renom_production CHARACTER  SET utf8 COLLATE  utf8_general_ci"
mysql -u$root_user -p$root_pass -e " CREATE USER $user@localhost IDENTIFIED BY '$pass'   "
mysql -u$root_user -p$root_pass -e " GRANT ALL ON renom_development.* TO $user@localhost "
mysql -u$root_user -p$root_pass -e " GRANT ALL ON renom_test.* TO $user@localhost "
mysql -u$root_user -p$root_pass -e " GRANT ALL ON renom_production.* TO $user@localhost "
mysql -u$root_user -p$root_pass -e " FLUSH PRIVILEGES "

mysql -u$root_user -p$root_pass -e "SHOW DATABASES" 
echo "CREATED db"
}

function drop_db {

echo "Function DROP_DB()"
mysql -u$root_user -p$root_pass -e "SHOW DATABASES" 
mysql -u$root_user -p$root_pass -e " drop database renom_development"
mysql -u$root_user -p$root_pass -e " drop database renom_test"
mysql -u$root_user -p$root_pass -e " drop database renom_production"
mysql -u$root_user -p$root_pass -e " DROP USER  $user@localhost"

mysql -u$root_user -p$root_pass -e "SHOW DATABASES" 

mysql -u$root_user -p$root_pass -e " FLUSH PRIVILEGES "

echo "DATABASE drop"
}


function tests {
mysql -u$user -p$pass  renom_development -e "show tables"

}


drop_db
create_db

tests

exit 0;

