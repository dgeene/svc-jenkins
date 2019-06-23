FROM jenkins/jenkins:lts

USER root

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl \
    gnupg2 software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian    $(lsb_release -cs)    stable"

RUN apt-get update  -qq \
    && apt-get install docker-ce=17.12.1~ce-0~debian -y

RUN usermod -aG docker jenkins

RUN curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose

