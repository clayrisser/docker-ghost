CWD := $(shell readlink -en $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))
.PHONY: all
all: fetch_dependancies build sweep push

## BUILD ##
.PHONY: build
build:
	docker pull jamrizzi/ghost:latest
	docker build -t jamrizzi/ghost:latest -f $(CWD)/Dockerfile $(CWD)/
	$(info built jamrizzi/ghost)

## PUSH ##
.PHONY: push
push:
	docker push jamrizzi/ghost:latest
	$(info pushed jamrizzi/ghost)

## CLEAN ##
.PHONY: clean
clean: sweep bleach
	$(info cleaned)
.PHONY: sweep
sweep:
	$(info swept)
.PHONY: bleach
bleach:
	$(info bleached)

## FETCH DEPENDANCIES ##
.PHONY: fetch_dependancies
fetch_dependancies: docker
	$(info fetched dependancies)

.PHONY: docker
docker:
ifeq ($(shell whereis docker), $(shell echo docker:))
	curl -L https://get.docker.com/ | bash
endif
	$(info fetched docker)
