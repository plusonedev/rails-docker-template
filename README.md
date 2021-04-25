# Starting a new project
## Initial Setup
1. Clone the repo
`git clone git@github.com:plusonedev/rails-docker-template.git {app_name} && cd {app_name}`
2. set environmental variables in .env file
3. Initialize the new rails app - I prefer postgresql (this will overwrite this file, just keep it open and undo the changes).
`docker-compose run --no-deps app rails new . --force --database=postgresql`
4. Build the images
`docker-compose build`
5. Edit database config in rails
```
# config/database.yml

default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: myapp_development


test:
  <<: *default
  database: myapp_test
```
6. Spin up the project
`docker-compose up`
7. Once everything is up and running, create the database
`docker-compose run app rake db:create`
