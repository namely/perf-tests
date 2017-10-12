# the purpose is to run both iperf test(in golang) and dnsperf test(in Python)

#todo: how to inject k8s config file into the container so that it points to production cluster?

FROM golang:1.9 AS builder

WORKDIR /go/src/github.com/namely/k8s-network-perf-tests
RUN go run network/benchmarks/netperf/launch.go --hostnetworking --iterations 1

