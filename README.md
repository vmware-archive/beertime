# Beer Time

Beer Time helps plan a beer order.

## Getting Started

Install dependencies and setup database.
```
bundle install
rake db:create db:migrate
```

Start development server.
```
rails s
```

Set up environment variables.

For HTTP Basic Auth, make sure to set up `HTTP_BASIC_AUTH_USERNAME` and `HTTP_BASIC_AUTH_PASSWORD`

## Running Tests
```
rspec
```

## Cloud Foundry

Run this after the first time you deploy to PWS.
```
cf ssh beertime -c '/tmp/lifecycle/launcher "app" "rake db:seed" ""'
```
