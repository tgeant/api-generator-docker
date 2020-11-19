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

RUN npm install -g yo
RUN npm install -g generator-rest
RUN npm install bcrypt@1.0.3

RUN chown -R docker /app

USER docker

CMD sudo chown -R docker /app && sudo npm run dev
