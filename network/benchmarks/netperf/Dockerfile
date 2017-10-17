FROM golang:1.9-alpine AS builder

WORKDIR /go/src/github.com/namely/perf-tests/network/benchmarks/netperf
ADD vendor/ vendor/
#ADD credentials/ credentials/
ADD ./launch.go launch.go
ADD ./config config

CMD go run ./launch.go --hostnetworking --iterations 1
