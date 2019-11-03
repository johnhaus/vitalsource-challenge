This is a simple Ruby app using the Rails framework.

Ruby version is 2.2.4 and this app uses Webpacker and MySQL.

After installing the app, run
    bundle
and then run
    yarn
to install dependencies.

This app is designed to use MySQL. To set it up create a .env file and add the following line, changing the part that states CHANGE_THIS_TO_YOUR_MYSQL_PASSWORD to your password for MySQL.
    MYSQL_KEY=CHANGE_THIS_TO_YOUR_MYSQL_PASSWORD

To create the database, run
    rails db:create
    rails db:migrate

and if you want to use the seed file run
    rails db:seed

Run
    rails s
to start the server.

Tests for this app are based on Firefox, not Chrome. Run
    rails test:system
to run all tests.
