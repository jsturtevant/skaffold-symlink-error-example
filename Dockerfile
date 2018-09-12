FROM golang:1.10.3-alpine3.8 as builder

WORKDIR /go/src/github.com/jsturtevant/sym-link-bug
COPY . .

RUN CGO_ENABLED=0 go test ./pkg/...
RUN CGO_ENABLED=0 go build -a -tags netgo -o /cmd github.com/jsturtevant/sym-link-bug

FROM alpine:3.8
RUN apk update \
    && apk add ca-certificates \
    && rm -rf /var/cache/apk/* \
    && update-ca-certificates
    
ENTRYPOINT ["/cmd"]
COPY --from=builder /cmd /