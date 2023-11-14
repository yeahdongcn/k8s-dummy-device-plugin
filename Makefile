.DEAFULT_GOAL := all

.PHONY: all image deploy
all: image deploy

image:
	docker build -t fake-device-plugin:0.0.2 .
	kind load docker-image fake-device-plugin:0.0.2 --name vcluster

deploy:
	kubectl apply -f examples/daemonset.yml