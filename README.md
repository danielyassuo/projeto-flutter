# Projeto bolinha — App de Receitas

App em Flutter para ver receitas, pesquisar pelo nome, ler ingredientes e modo de preparo e salvar favoritas. Os dados vêm da API [DummyJSON Recipes](https://dummyjson.com/docs/recipes).

## Funcionalidades

- Lista de receitas com foto e nota
- Pesquisa pelo nome
- Detalhes com ingredientes e modo de preparo
- Favoritos durante o uso do app
- Mensagens de carregamento, erro e "nenhum resultado"

Os detalhes usam a receita que já veio da lista, sem nova chamada à API.

## SDK e dependências

- Flutter 3.47.7
- Dart 3.13.5
- http ^1.6.0

## Como executar

```bash
git clone https://github.com/danielyassuo/projeto-flutter.git
cd projeto-flutter
flutter pub get
flutter run
```

É preciso ter um emulador aberto ou um celular conectado, e internet para carregar as receitas.
