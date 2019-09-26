# 1. Build image


## 1.1 Build mainline nginx alpine image

```
make VERSION=1.17.3-alpine TAGS=1.17.3-alpine:mainline-alpine:1-alpine:1.17-alpine alpine-image
```

## 1.2 Build mainline alpine-perl image

```
make VERSION=1.17.3-alpine-perl TAGS=1.17.3-alpine-perl:mainline-alpine-perl:1-alpine-perl:1.17-alpine-perl:alpine-perl alpine-image
```

## 1.3 Build stable nginx alpine image

```
make VERSION=stable-alpine TAGS=1.16.1-alpine:stable-alpine:1.16-alpine alpine-image
```

## 1.4 Build stable alpine-perl image

```
make VERSION=stable-alpine-perl TAGS=1.16.1-alpine-perl:stable-alpine-perl:1.16-alpine-perl alpine-image
```

# 2. Push image to docker hub

## 2.1 Push alpine images

```
make TAGS=1.17.3-alpine:mainline-alpine:1-alpine:1.17-alpine push
make TAGS=1.17.3-alpine-perl:mainline-alpine-perl:1-alpine-perl:1.17-alpine-perl:alpine-perl push
make TAGS=1.16.1-alpine:stable-alpine:1.16-alpine push
make TAGS=1.16.1-alpine-perl:stable-alpine-perl:1.16-alpine-perl push
```

# 3. Run a test container

## 3.1 Run container based on alpine image

```
make runalpine
```
