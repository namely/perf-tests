# the purpose is to run both iperf test(in golang) and dnsperf test(in Python)

#todo: how to inject k8s config file into the container so that it points to production cluster?
#todo: why docker-compose is needed?

FROM golang:1.9 AS builder

WORKDIR /go/src/github.com/namely/k8s-network-perf-tests
RUN go run network/benchmarks/netperf/launch.go --hostnetworking --iterations 1k/benchmarks/netperf/launch.go --hostnetworking --iterations 1

RUN mkdir dns/out/

#todo: cleanup all the .out files
RUN dns/run --params params/default.yaml --use-cluster-dns --out-dir dns/out
RUN dns/ingest --db dsn/out/db dns/out/latest/*.out

