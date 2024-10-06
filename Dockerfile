FROM    golang AS builder
    WORKDIR /app
    COPY    /src/ ./
    RUN     go build -ldflags="-s -w" -o ola-mundo

FROM scratch
    COPY --from=builder /app/ola-mundo /ola-mundo
    CMD ["/ola-mundo"]
