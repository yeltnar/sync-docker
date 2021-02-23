FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install rsync -y
RUN apt-get install openssh-client -y 
RUN apt-get install curl -y
RUN apt-get install -y git
# RUN apt-get install openssh-server -y 

# feel free to remove this curl
RUN curl https://raw.githubusercontent.com/yeltnar/gist/master/setup.sh | bash

COPY ./gitignore /root/gist/gitignore
COPY sync.sh ./
COPY ./.ssh /root/.ssh

WORKDIR /workdir

CMD tail -f /dev/null
# CMD ls ~/gist/gitignore
