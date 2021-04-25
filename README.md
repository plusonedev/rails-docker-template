# Starting a new project
## Initial Setup
1. Clone the repo
`git clone git@github.com:plusonedev/rails-docker-template.git {app_name}`
2. set environmental variables in .env file
3. Initialize the new rails app - I prefer postgresql (this will overwrite this file, just keep it open and undo the changes).
`docker-compose run --no-deps app rails new . --force --database=postgresql`
4. Edit database config in rails
5. Spin up the project
`docker-compose up`
6. Once everything is up and running, create the database
`docker-compose run app rake db:create`

