NAME   := praqma/ngingo
TAG    := $$(git log -1 --pretty=%h)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest



build:
	@echo ${IMG}
	@docker build -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

push:
	@docker push ${NAME}

run:
	@docker run -d --rm -it -p 8080:8080 --name ngingo ${NAME}

stop:
	@docker stop ngingo

runk:
	@kubectl run hello-ngingo --image=${IMG} --port=8080
	@kubectl expose deployment hello-ngingo --type=NodePort

stopk:
	@kubectl delete svc hello-ngingo
	@kubectl delete deployment hello-ngingo
