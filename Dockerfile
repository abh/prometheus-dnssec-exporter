FROM golang:1.17-alpine

WORKDIR /app
COPY . ./
RUN go mod download
RUN go build -o /bin/prometheus-dnssec-exporter
ENTRYPOINT [ "/bin/prometheus-dnssec-exporter" ]

