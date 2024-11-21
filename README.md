# Aulas

Projeto de slides feito com `reveal.js`

## Dependencias

- `reveal.js`: base do projeto
- `docker compose`: inicia o ambiente
- `decktape`: imprime a aula em pdf
- `gulp`: inicia o servidor

## Start

### Manual

`npm i --omit=optional` para instalar so as dependências principais
`npm start` para iniciar

### Docker

`export AULA=caminho/para/aula.md && npm run present`

Exemplo:
`export AULA=slides/exemple.md && npm run present`

## Print

`npm run print`

## Selecionando uma aula

### Manual

Por hora a seleção de aulas é manual, copiando e colando o conteúdo da aula em questão dentro do arquivo `content.md`

### Docker

Exportando a variável `AULA` para o caminho do `arquivo.md` que deseja apresentar

Exemplo:
`export AULA=caminho/para/aula.md`

## Adicionando apresentação pessoal (whoami)

Adicionar ou edite arquivo `slides/whoami.html`, ele precisa ser no formato HTML.

O projeto aceita utilizar 2 colunas, conforme exemplo do meu proprio `whoami`.

Para surtir efeito, adicione a instrução `<!-- WHOAMI_REPLACE -->` dentro do seu slide, que o start.sh automaticamente vai substituir por este conteúdo pelo seu `whoami.html`.

## Criando seus slides

Os slides usam a notação markdown tradicional pura, não precisa criar ou ajustar o `content.md` ou o `index.html`, por padrão uso o `slides/exemple.md`, o script `start.sh` ajusta o `content.md` automaticamente e o `index.html` sempre vai ler direto deste arquivo, veja mais informacoes [aqui](https://revealjs.com/markdown/).

Cada novo slide precisa ser separado por `---`, para transição horizontal, ou `--` para transição vertical.

Não esqueça de testar a formatação para garantir que nenhum conteudo se perdeu por falta de espaço em tela!
