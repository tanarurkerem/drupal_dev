image_name = tanarurkerem/drupal-dev
makefiledir = $(shell pwd)
project = $(shell basename $(shell pwd))
drupal_docker_name = "$(project)-drupal"
mysql_docker_name = "$(project)-mysql"
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
	# make push    - push builded web image to docker.hub
	#

run:
	docker run --name $(mysql_docker_name) -e MYSQL_ROOT_PASSWORD=root -d mysql
	docker run --name="$(drupal_docker_name)" --link $(mysql_docker_name):mysql -p 80:80 -v $(shell pwd)/html:/var/www/html -d $(image_name)

build:
	docker build -t $(image_name) .

bash:
	docker run -t -i --rm --link $(mysql_docker_name):mysql -v $(shell pwd)/html:/var/www/html --workdir /var/www/html --entrypoint bash $(image_name)

mysql:
	docker run -t -i --rm --link $(mysql_docker_name):mysql --entrypoint mysql $(image_name) -u root -proot -h mysql

drush:
	docker run -t -i --rm --link $(mysql_docker_name):mysql -v $(shell pwd)/html:/var/www/html --workdir /var/www/html --entrypoint drush $(image_name) $(filter-out $@,$(MAKECMDGOALS))

stop:
	docker stop $(drupal_docker_name)
	docker stop $(mysql_docker_name)

start:
	docker start $(mysql_docker_name)
	docker start $(drupal_docker_name)

clean:
	docker rm $(drupal_docker_name)
	docker rm $(mysql_docker_name)

#For command line parameters
%:
	@:
