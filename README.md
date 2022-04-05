# LaTeX pra Github

## O que se faz aqui?

Esse repo serve de esqueleto para compilar qualquer trabalho em LaTeX via Github Actions

## Dependências

Agora, somente o Docker. :)

## Como usar

O arquivo que será compilado deve se chamar `arquivoPrincipal.tex` e deve estar na pasta `documento`. Não importa quais são as dependencias internas do arquivo, se haverá include ou não dentro do LaTeX, basta que o arquivo tenha o nome correto. A action executará em caso de mudança no arquivo `arquivoPrincipal.tex`, então é sugerido que seja utilizado um comentário serial, como por exemplo:

```latex
% 202204051537
% Daqui para baixo, vem o código
```

## TODO

* Tornar mais flexível usando environment do Github+.env
* What else? 

## Creditos

Ademais todos os softwares livres utilizados aqui - como o <span class="latex">L<sup>a</sup>T<sub>e</sub>X</span> [1]</cite>, este repositório só exise por conta das seguintes entidades:

[Talita Cristina](https://github.com/talitacristina-c) e seu mestrado;

[IFCH - Unicamp](https://www.ifch.unicamp.br/) com a insistência em ignorar padrões de escrita;

Ao [template](https://www.overleaf.com/latex/templates/template-para-teses-e-dissertacoes-da-demografia-ifch-unicamp/snsdycndyfjg) criado por [José H C Monteiro da Silva](https://github.com/josehcms).


[1]: E não é por essas e outras que o Markdown não substituiu o <span class="latex">L<sup>a</sup>T<sub>e</sub>X</span> :)
