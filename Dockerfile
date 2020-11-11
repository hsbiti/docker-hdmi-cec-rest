FROM balenalib/rpi-raspbian:jessie
MAINTAINER Hamza Sbiti <hamza>

# remove resin repo
RUN rm /etc/apt/sources.list.d/balenalib.list && \
    apt-key del 92BF1079

# install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
	golang-go libcec-dev cec-utils make git build-essential \
  libraspberrypi0 libraspberrypi-dev libraspberrypi-bin pkg-config

ENV GOPATH=/go

RUN mkdir /go

RUN go get github.com/hsbiti/hdmi-cec-rest

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/go/bin/hdmi-cec-rest"]
