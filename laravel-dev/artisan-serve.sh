#!/bin/bash

cd /workspace
echo "Starting the laravel self-built development server on http://0.0.0.0:80 ..."
if ! [ -f ./artisan ]; then 
    echo "No artisan found. Create an empty project? [Y/n]"
    read answer
    case $answer in
    "Y")
        echo "Creating ..."
        composer create-project laravel/laravel --prefer-dist ./ 
        ;;
    *)
        echo "Use 'composer create-project laravel/laravel --prefer-dist ./' to create an empty laravel here."
        ;;
    esac
fi

if [ -f ./artisan ]; then 
    php ./artisan || /usr/local/bin/composer update
    php ./artisan serve --host=0.0.0.0 --port=80 &
    echo "You can use command like composer dump, php artisan migrate here."
fi

sleep 5
echo "This is an bash interactive environment with composer, php56."
echo "enter 'exit' to exit and close the dev env."
bash
