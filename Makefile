NAME   := ngingo
TAG    := $$(git log -1 --pretty=%h)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest

.PHONY: debug
debug:
	@echo ${IMG}
	@touch file

build:
	@echo ${IMG}
	@docker build -t ${IMG} .
#  @docker tag ${IMG} ${LATEST}

#push:
#  @docker push ${NAME}
