help:
	@echo "How to use:"
	@echo
	@echo "  $$ make setup    setup up after initial clone"
	@echo "  $$ make serve    start the local development environment"
	@echo "  $$ make test     run the full test suite and linting"
	@echo
	@echo "See https://github.com/carmenlogue/micropop_v2 for more details."
setup:
	docker-compose build
	docker-compose up -d database
	@sleep 2read
	docker-compose run --rm web bin/setup
	docker-compose kill

serve:
	rm tmp/pids/server.pid 2>/dev/null || true
	docker-compose up

test:
	docker-compose run --rm web bundle exec rspec
	docker-compose run --rm web bundle exec rubocop
