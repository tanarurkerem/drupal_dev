makefiledir = $(shell pwd)
alias = "make -f $(makefiledir)/Makefile -- "

info:
	# Useage:
	#
	# dd run     - run docker containers
	# dd stop    - stop docker cotntainers
	# dd start   - start again docker containers
	# dd clean   - remove (rm) docker containers
	#
	# dd drush   - run drush inside docker containers
	# dd mysql   - run mysql console inside docker containers
	# dd bash    - run bash inside web docker containers
	#
	# Install:
	#
	#  Add the folloving line to your ~/.bashrc
	#
	#  alias dd=$(alias)
	#
	# Build image:
	#
	# make build   - build web image from Dockerfile
	#

run:
	docker-compose up -d

bash:
	docker-compose exec web /bin/bash

mysql:
	docker-compose exec web mysql -u root -proot -h mysql

drush:
	docker-compose exec web drush $(filter-out $@,$(MAKECMDGOALS))

stop:
	docker-compose stop

start:
	docker-compose start

clean:
	docker-compose rm -f

#For command line parameters
%:
	@:

build:
	docker-compose build

