install:
	bundle install

lint:
	bundle exec rubocop

test:
	rspec spec