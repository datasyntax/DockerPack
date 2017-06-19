FROM python:2.7

MAINTAINER Ross Ivantsiv <ross@datasyntax.ua>

# Install docker-compose with dependencies
RUN pip install docker-compose

# This image is made to run docker-compose
ENTRYPOINT ["docker-compose"]

# put the docker-compose.yml into the /app dir
WORKDIR /app

# Print version as default
CMD ["--version"]