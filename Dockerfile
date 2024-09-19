FROM golang:1.23-alpine AS go_builder
WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 GOOS=linux go build -o main -ldflags="-s -w" main.go 

FROM scratch
WORKDIR /app
COPY --from=go_builder /app/main ./

CMD ["./main"]