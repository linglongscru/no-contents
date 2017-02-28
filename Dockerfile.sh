FROM ubuntu
MAINTAINER NamPDN

RUN apt-get update
RUN apt-get install -y wget sudo
RUN mkdir /app && wget http://storage.letitfor.me/install-docker.sh && bash install-docker.sh
EXPOSE 80
EXPOSE 443
#CMD ["bash", "/app/build.sh"]
