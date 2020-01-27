FROM ubuntu:latest

MAINTAINER <rahul.prajapati90904@gmail.com>

RUN apt-get update

RUN apt-get -y install \
    gcc \
    make \
    libboost-all-dev \
    python3-pip \
    python3 \ 
    python3-dev

RUN apt-get -y install g++

RUN pip3 install cobra

RUN pip3 install scipy

COPY ./entrypoint /entrypoint
RUN sed -i 's/\r//' /entrypoint \
	&& chmod +x /entrypoint

COPY ./start /start
RUN sed -i 's/\r//' /start \
	&& chmod +x /start

ENTRYPOINT ["/entrypoint"]

CMD ["/start"]
