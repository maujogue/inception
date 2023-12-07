
all: build

build:
		docker-compose  --project-directory ./srcs up --detach

stop:
		docker-compose --project-directory ./srcs down