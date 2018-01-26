FROM golang:1.9 AS builder

WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 go build -o ngingo

FROM alpine
EXPOSE 80
WORKDIR /app
COPY --from=builder /go/src/app /app/
RUN ls -al
ENTRYPOINT ./ngingo
