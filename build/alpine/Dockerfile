ARG VERSION=alpine
FROM nginx:${VERSION}

ENV USER=www-data

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$USER" \
    --no-create-home \
    "$USER"

# create site conf dir if not exist
RUN [ -d /etc/nginx/conf.d/ ] || mkdir -p /etc/nginx/conf.d/

# Copy required files
COPY server-configs-nginx/nginx.conf /etc/nginx/nginx.conf
COPY server-configs-nginx/h5bp /etc/nginx/h5bp
COPY server-configs-nginx/mime.types /etc/nginx/mime.types
