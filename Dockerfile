FROM golang:1.27.1-alpine AS builder
WORKDIR /build
COPY go.mod go.sum* ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /build/app main.go

# 极致优化：使用完全空白的 scratch 镜像
FROM scratch
WORKDIR /app
COPY --from=builder /build/app .
EXPOSE 8080
CMD ["./app"]
