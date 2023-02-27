FROM golang:alpine3.14 as builder

COPY . .

RUN go build -o /hello hello.go

FROM scratch
WORKDIR /
COPY --from=builder /hello /hello
EXPOSE 8080
ENTRYPOINT ["/hello"]