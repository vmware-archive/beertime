tests: setup units printSuccess

citests: cisetup units printSuccess

units:
	@rubocop && rspec

bundle:
	@bundle install

printSuccess:
	@./bin/printSuccess.sh

setup:
	@rails db:migrate RAILS_ENV=test

cisetup:
	@rails db:drop RAILS_ENV=test
	@rails db:create RAILS_ENV=test
	@rails db:migrate RAILS_ENV=test

deploy:
	@cf push beertime
