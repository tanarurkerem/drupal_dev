Drupal Development Environment With Docker
==========================================

Install
=======

* git clone https://github.com/tanarurkerem/drupal\_dev.git
* cd drupal\_dev
* make

Follow the installations instructions, add an alias call "dd"

Example:

alias dd='make -f /Users/pp/Work/drupal-dev/Makefile -- '

How to use
==========

* Build your Drupal site to the "html" directory
* dd run
* dd mysql
* create database drupal;
* exit
* dd drush si minimal --db-url=mysql://root:root@mysql/drupal
* You are ready for use Drupal.
* 127.0.0.1 on Linux and "boot2docker ip" on Mac OSX

