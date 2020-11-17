FROM node:9.11.1-jessie


WORKDIR /app

#sudo

RUN apt-get update && \
      apt-get -y install sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo


#root commands

USER root

#Remove root password
RUN echo 'docker     ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#mongodb
RUN mkdir -p /data/db

#install

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.6 main" | tee /etc/apt/sources.list.d/mongodb-org-3.6.list
RUN apt-get update
RUN apt-get -y install mongodb-org

RUN npm install -g yo
RUN npm install -g generator-rest
RUN npm install bcrypt@1.0.3

RUN chown -R docker /app

USER docker

CMD sudo chown -R docker /app && sudo mongod & sudo npm run dev & /bin/bash
