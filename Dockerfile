FROM golang:1.9 AS builder

EXPOSE 8080
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 go build -o ngingo

FROM alpine
WORKDIR /app
COPY --from=builder /go/src/app /app/
RUN ls -al
ENTRYPOINT ./ngingo
