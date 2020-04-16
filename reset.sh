#/bin/bash
export SECRET_KEY_BASE=000000000000000000000000000000000
echo $1
case $1 in 
  "production")
     echo " Production"
     export RAILS_ENV=production
RAILS_ENV=production rake db:drop 
RAILS_ENV=production rake db:create 
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake db:seed

    ;;
  *) 
    echo "Development defaults"
    export RAILS_ENV=development
rake db:drop RAILS_ENV=development
rake db:create RAILS_ENV=development
rake db:migrate RAILS_ENV=development
rake db:seed RAILS_ENV=development
;;
esac


