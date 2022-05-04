FROM caddy:2.5.0-alpine

# Expôe a porta 80 para poder ser mapeada futuramente
EXPOSE 80/tcp

# Garante que o diretório das páginas existe
RUN mkdir -p /usr/src/pages

# Copia os arquivos para o container
COPY *.html /usr/src/pages/
COPY Caddyfile /etc/caddy/Caddyfile
