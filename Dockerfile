FROM golang:alpine as builder
# imagem com golang instalando com alias builder
WORKDIR /go/src/app
# Ir para esse diretorio
COPY . .
# Copiar todos os arquivo para dentro do workdir
RUN CGO_ENABLED=0 go build -o /app main.go
# Compilando um binário estático para executar sem dependências
FROM scratch
# Utilizando imagem scratch extremamente enxuta
COPY --from=builder /app /app
# Copiando app para dentro da imagem
CMD ["/app"]
# Rodando imagem