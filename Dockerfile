FROM ubuntu:xenial
MAINTAINER Shaun Martin <shaun@samsite.ca>

RUN apt-get update && \
  apt-get install -y \
    curl \
    && \
  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get install -y nodejs && \
  npm install -g truffle

RUN apt-get update && \
  apt-get install -y \
    software-properties-common \
    python-software-properties \
    && \
  add-apt-repository ppa:ethereum/ethereum && \
  apt-get update && \
  apt-get install -y solc

ADD . /workspace/

RUN apt-get update && \
  apt-get install -y python-pip && \
  pip install -r /workspace/requirements.txt -r /workspace/requirements_dev.txt

WORKDIR /workspace
VOLUME /workspace

CMD ["flask", "run", "--host=0.0.0.0"]
