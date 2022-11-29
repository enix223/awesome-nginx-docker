VERSION ?= latest
TAGS ?= latest
TAG_LIST = $(subst :, ,$(TAGS))

.PHONY alpine-image:
alpine-image:
	docker build --build-arg VERSION=$(VERSION) -f build/alpine/Dockerfile -t enix223/awesome-nginx:$(VERSION) .
	for tag in $(TAG_LIST) ; do \
		docker tag enix223/awesome-nginx:$(VERSION) enix223/awesome-nginx:$$tag; \
	done


.PHONY alpine:
alpine:
	make VERSION=1.23.2-alpine TAGS=1.23.2-alpine:mainline-alpine:1-alpine:1.23-alpine alpine-image
	make VERSION=1.23.2-alpine-perl TAGS=1.23.2-alpine-perl:mainline-alpine-perl:1-alpine-perl:1.23-alpine-perl:alpine-perl alpine-image


.PHONY push:
push:
	for tag in $(TAG_LIST) ; do \
		docker push enix223/awesome-nginx:$$tag; \
	done


.PHONY push-alpine:
push-alpine:
	make TAGS=1.23.2-alpine:mainline-alpine:1-alpine:1.23-alpine push
	make TAGS=1.23.2-alpine-perl:mainline-alpine-perl:1-alpine-perl:1.23-alpine-perl:alpine-perl push


.PHONY runalpine:
runalpine:
	docker run -it -d --name awesome-nginx-test \
		-p 80:80 \
		-v $(shell pwd)/test/:/var/www/public \
		-v $(shell pwd)/test/conf.d/:/etc/nginx/conf.d/ \
		enix223/awesome-nginx:alpine
