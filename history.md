# Criação da imagem

O primeiro passo foi criar uma imagem customizada com nossas páginas e a configuração do caddy. Para isso, executamos o seguinte comando no diretório de trabalho:

```bash
docker image build . -t miniep6-caddy:2.5.0-alpine
```

Isso gerou a imagem `miniep6.caddy:2.5.0-alpine`. Podemos conferir que a imagem foi gerada corretamente usando o comando `docker image ls`.

# Executando a imagem (aka, criando um container)

Com a imagem criada, criamos então um container para executá-la usando o comando: 

```bash
docker container run -d \
    -p 8080:80 \
    miniep6-caddy:2.5.0-alpine 
```

Note que aqui que fazemos o remapeamento (ou _publish_) da porta 80 do container na porta 8080 da máquina local. Com isso feito, o container deve rodar com sucesso, o que pode ser testado com a ferramenta `httpie` ou acessando pelo navegador. Pelo `httpie`, o teste fica:

```bash
http :8080
http :8080/about.html
```
