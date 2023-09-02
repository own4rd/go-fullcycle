FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY go.mod main.go  ./

RUN go mod download

RUN go build -o main .

# ---------------------------------- END BUILDER ---------------------------

FROM scratch

COPY --from=builder /usr/src/app/main .

ENTRYPOINT [ "./main" ]