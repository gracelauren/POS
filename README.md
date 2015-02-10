Point of Sale
================

by Grace Mekarski and Jackie Fletcher

Point of Sale is a website that uses a database and Sinatra to allow a company to add add products to their inventory, and create a reciept and total for each customer.

Installation
------------

Install Employee and Project Tracker DB by first cloning the repository.  
```
$ git clone http://github.com/gracelauren/POS.git
```

Install all of the required gems:
```
$ bundle install
```

Start the database in another tab of the terminal:
```
$ postgres
```

Create the databases and tables by cd-ing into your Company_Tracker-master folder then in the terminal run the following:

```

```
$ rake db:create

```

```
$ rake db:schema:load

```

```
$ rake db:test:prepare
```

```
```

Start the webserver:
```
$ ruby app.rb
```

In your web browser, go to http://localhost:4567

License
-------

GNU GPL v2. Copyright 2015 Grace Mekarski and Jackie Fletcher 
