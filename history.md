# Criação da imagem

O primeiro passo foi criar uma imagem customizada com nossas páginas e a configuração do caddy. Para isso, executamos o seguinte comando no diretório de trabalho:

```bash
docker image build . -t miniep6-caddy:2.5.0-alpine
```

Isso gerou a imagem `miniep6.caddy:2.5.0-alpine`. Podemos conferir que a imagem foi gerada corretamente usando o comando `docker image ls`.

# "Executando" a imagem (aka, criando um container)

Com a imagem criada, criamos então um container para executá-la usando o comando: 

```bash
docker container run -d \
    -p 8080:80 \
    -v $(pwd)/pages/:/usr/src/pages \
    --name=caddy_server \
    miniep6-caddy:2.5.0-alpine
```

Note que quando executamos a imagem também fazemos mais duas operações:

1. O remapeamento (ou _publish_) da porta 80 do container na porta 8080 da máquina local;

2. A associação do diretório local `./pages` com o volume `/usr/src/pages` do container;

Ambas as operações **não** podem ser feitas diretamente pela _Dockerfile_ pois dependem do ambiente de execução. Com isso feito, o container deve rodar com sucesso, o que pode ser testado com a ferramenta `httpie` ou acessando [localhost:8080]() pelo navegador. Pelo `httpie`, o teste fica:

```bash
http :8080
http :8080/about.html
```
