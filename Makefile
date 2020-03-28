NAME=sumikof/openstack-keystone
VERSION=arm

build:
	docker build -t $(NAME) .
	docker build -t $(NAME):$(VERSION) .

push:
	docker push $(NAME)
