FROM ubuntu:16.04

MAINTAINER Jeltje van Baren, jeltje.van.baren@gmail.com

RUN apt-get update && apt-get install -y \
    imagemagick \
    make

# Install perl modules 
RUN apt-get install -y cpanminus 
RUN cpanm CPAN::Meta File::NCopy 

ADD ./batch_fastqc /usr/local/bin/

# Set WORKDIR to /data -- predefined mount location.
RUN mkdir /data
WORKDIR /data

ENTRYPOINT ["perl", "/usr/local/bin/batch_fastqc"]
