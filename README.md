##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.5.3]
- Rails [5.2.4]

##### 1. Check out the repository

```bash
git clone git@github.com:Sirbuland/cinema_app_backend.git
```

##### 2. Create database.yml file

Change database configuration according to database on your local machine.

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```
##### 4. Add OMDB API key
create application.yml and copy and paste content of application.yml.sample in it. then replace value of OMDB_API_KEY with valid API key to fetch the movie information from OMDB

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

##### 6. Usage instructions

There are 2 users created for you in the seeds file, with the following credentials:

Internal User:
```
Email: john.doe@gmail.com
Password: 12345678
```

Customer User:
```
Email: john.customer@gmail.com
Password: 12345678
```

Following Movies are also created in database:
```
The Fast and the Furious
2 Fast 2 Furious
The Fast and the Furious: Tokyo Drift
Fast & Furious
Fast Five
Fast & Furious 6
Furious 7
The Fate of the Furious
```

I also created one review on all the above mentioned movies with the created customer user.

##### 7. API Documentation

Here is the postman collection which contains all the APIs with parameters.
https://www.getpostman.com/collections/84f4e1a3d32044966ddf

