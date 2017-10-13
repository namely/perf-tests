FROM golang:1.9-alpine AS builder

WORKDIR /go/src/github.com/namely/perf-tests
ADD vendor/ vendor/
ADD ./launch.go launch.go
RUN mkdir -p /opt/apps/launch
RUN go build -o /opt/apps/launch/launch ./launch.go

FROM alpine:latest

# RUN apt-get update \
#     && rm -rf /var/lib/apt/lists/*
# RUN mkdir -p /tmp
# WORKDIR /tmp
# # Download and build netperf from sources
# RUN curl -LO https://github.com/HewlettPackard/netperf/archive/netperf-2.7.0.tar.gz
# RUN tar -xzf netperf-2.7.0.tar.gz
# RUN cd netperf-netperf-2.7.0 && ./configure --prefix=/usr/local --bindir /usr/local/bin && make && make install

COPY --from=builder /opt/apps/launch/launch /usr/bin/

ENTRYPOINT ["launch"]
