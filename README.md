# LaTeX pra Github

## O que se faz aqui?

Esse repo serve de esqueleto para compilar qualquer trabalho em LaTeX via Github Actions

## Dependências

Agora, somente o Docker. :)

## Como usar

O arquivo que será compilado deve se chamar `arquivoPrincipal.tex`. Não importa quais são as dependencias internas do arquivo, se haverá include ou não dentro do LaTeX, basta que o arquivo tenha o nome correto. A action executará em caso de mudança no arquivo `arquivoPrincipal.tex`, então é sugerido que seja utilizado um comentário serial, como por exemplo:

```latex
% 202204051537
% Daqui para baixo, vem o código
```

## TODO

* Tornar mais flexível usando environment do Github+.env
* What else? 
