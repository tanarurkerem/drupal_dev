project = $(shell basename $(shell pwd))
drupal_docker_name = "$(project)-drupal"
mysql_docker_name = "$(project)-mysql"

valami:
	echo $(project)
	echo $(drupal_docker_name)
	echo $(mysql_docker_name)

build:
	docker build -t drupal-dev .

bash:
	docker run -t -i --rm --link $(mysql_docker_name):mysql -v $(shell pwd)/html:/var/www/html --workdir /var/www/html --entrypoint bash drupal-dev

mysql:
	docker run -t -i --rm --link $(mysql_docker_name):mysql --entrypoint mysql drupal-dev -u root -proot -h mysql

drush:
	docker run -t -i --rm --link $(mysql_docker_name):mysql -v $(shell pwd)/html:/var/www/html --workdir /var/www/html --entrypoint drush drupal-dev $(filter-out $@,$(MAKECMDGOALS))

run:
	docker run --name $(mysql_docker_name) -e MYSQL_ROOT_PASSWORD=root -d mysql
	docker run --name="$(drupal_docker_name)" --link $(mysql_docker_name):mysql -p 80:80 -v $(shell pwd)/html:/var/www/html -d drupal-dev

stop:
	docker stop $(drupal_docker_name)
	docker stop $(mysql_docker_name)

start:
	docker start $(drupal_docker_name)
	docker start $(mysql_docker_name)

clean:
	docker rm $(drupal_docker_name)
	docker rm $(mysql_docker_name)

#For command line parameters
%:
	@:
