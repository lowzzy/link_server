#!/bin/sh

echo "------------------------------"
echo "| settings.sh is doing.......... |"
echo "------------------------------"

FILE="Rakefile"

if  [ ! -e $FILE ]; then
    echo "file is not exist!"
    echo "--------------"
    echo "| rails new! |"
    echo "--------------"
    rails new . --force --database=mysql --skip-test --webpacker --api
    echo "---------------"
    echo "| rake create! |"
    echo "---------------"
    rake db:create
    cp database.yml config/database.yml
    rm database.yml
fi
echo "------------"
echo "| rails s ! |"
echo "------------"
bundle exec rails s -p 3000 -b '0.0.0.0'

echo "--------------------"
echo "| exec.sh is done! |"
echo "--------------------"
