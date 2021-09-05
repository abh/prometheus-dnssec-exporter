FROM golang:1.17-alpine AS build

WORKDIR /app
COPY . ./
RUN go mod download
RUN go build -o /bin/prometheus-dnssec-exporter

FROM alpine:3.14.2
COPY --from=build /bin/prometheus-dnssec-exporter /bin/prometheus-dnssec-exporter
ENTRYPOINT [ "/bin/prometheus-dnssec-exporter" ]
