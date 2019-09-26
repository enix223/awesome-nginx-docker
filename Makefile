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
	make VERSION=1.17.3-alpine TAGS=1.17.3-alpine:mainline-alpine:1-alpine:1.17-alpine alpine-image
	make VERSION=1.17.3-alpine-perl TAGS=1.17.3-alpine-perl:mainline-alpine-perl:1-alpine-perl:1.17-alpine-perl:alpine-perl alpine-image
	make VERSION=stable-alpine TAGS=1.16.1-alpine:stable-alpine:1.16-alpine alpine-image
	make VERSION=stable-alpine-perl TAGS=1.16.1-alpine-perl:stable-alpine-perl:1.16-alpine-perl alpine-image


.PHONY push:
push:
	for tag in $(TAG_LIST) ; do \
		docker push enix223/awesome-nginx:$$tag; \
	done


.PHONY push-alpine:
push-alpine:
	make TAGS=1.17.3-alpine:mainline-alpine:1-alpine:1.17-alpine push
	make TAGS=1.17.3-alpine-perl:mainline-alpine-perl:1-alpine-perl:1.17-alpine-perl:alpine-perl push
	make TAGS=1.16.1-alpine:stable-alpine:1.16-alpine push
	make TAGS=1.16.1-alpine-perl:stable-alpine-perl:1.16-alpine-perl push


.PHONY runalpine:
runalpine:
	docker run -it -d --name awesome-nginx-test \
		-p 80:80 \
		-v $(shell pwd)/test/:/var/www/public \
		-v $(shell pwd)/test/conf.d/:/etc/nginx/conf.d/ \
		enix223/awesome-nginx:alpine
