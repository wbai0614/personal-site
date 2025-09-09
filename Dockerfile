# syntax=docker/dockerfile:1
FROM nginx:1.27-alpine

# Cloud Run provides $PORT; default to 8080 for local runs
ENV PORT=8080

# Use nginx's envsubst templating so it listens on $PORT at runtime
RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/templates/default.conf.template

# Copy the static site
COPY ./ /usr/share/nginx/html

# Expose for local runs (Cloud Run ignores EXPOSE but it's handy)
EXPOSE 8080
