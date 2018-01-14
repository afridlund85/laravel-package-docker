# Laravel package development in docker

## Setup & Start

``````
git clone git@github.com:afridlund85/laravel-package-docker.git
cd laravel-package-docker
docker-compose up -d
``````

## Create a package

1. Create package dir in `packages`
2. `composer init` in your package dir
3. `git init` and setup repo origin etc
4. add package to root composer.json as require or require-dev
5. `composer dump-autoload` in root
6. develop: [laravel packages](https://laravel.com/docs/5.5/packages)
