FROM golang:1.14.9-alpine3.12 as build

WORKDIR /app

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM scratch

COPY --from=build /app/main /main

CMD ["/main"]
