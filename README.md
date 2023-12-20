# README

## Install

### Clone the repository

```bash
git clone https://github.com/shimroz1992/Portfolio_API_Assignment.git
cd PortfolioTracker

```

### Check your Ruby version

```bash
ruby -v
```

The output should start with something like 'ruby '3.1.1'

If not, install the right ruby version using rvm (it could take a while):

```bash
rvm install "ruby '3.1.1'"
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```bash
bundle
```

### Update database.yml file
In database.yml file, edit the database configuration as required.

### Initialize the database

```ruby
rails db:create db:migrate
```

### Run rake task to import Portfolio_Api application

```ruby
rails server
or
rails s
```
## If we want to run the application on Swager 
1) Improt the gem swagger use this link below
2) https://github.com/rswag/rswag
3) it's easy to install

run the below URL 
http://localhost:3000/api-docs/index.html

and without swagger, you can run
http://localhost:3000
