FROM nginx:latest

ADD webapp.html /www/
ADD nginx.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install curl -y --no-install-recommends && apt-get clean

# Included in the base image
# EXPOSE 80
# EXPOSE 443
# CMD nginx -g "daemon off;"


# HEALTHCHECK --interval=15s --timeout=30s --start-period=5s --retries=3 CMD [ "executable" ]
HEALTHCHECK --interval=15s --timeout=30s --start-period=5s --retries=3 CMD curl -I -f "http://localhost:80/webapp.html" || exit 1
