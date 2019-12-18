FROM buildbot/buildbot-worker

USER root
RUN apt update && apt upgrade -y
# git & curl deja installé
# Docker
RUN apt-get -y install git apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update
RUN apt-get -y install docker-ce
# on doit juste pouvoir faire un docker build
#Attention a verifier les lancemeent avec les -v docker.sock et --privileged
COPY ./Dockerfile .
RUN usermod -aG docker buildbot
