<h1 align="center">Welcome to Micro-blog 👋</h1>

> Micro-blog em Rails

Decisões tomadas e comentários:

> Exibir os posts por ordem do mais recentemente atualizado. Tomei essa decisão pois faria mais sentido poder ver no topo um post que foi alterado recentemente. Caso contrário, um post atualizado poderia se "perder" no meio dos posts antigos do blog. Quando o post é atualizado ele exibe a data de atualização juntamente com a data de publicação original.
  
>  O botão de deletar o post está visível para cada post na timeline. Essa configuração permite visualizar com mais facilidade as interações assincronas realizadas na timeline via Ajax.

> O formulário de criação do post também está localizado na timeline. Dessa forma também é possível visualizar com mais facilidade  a alteração da timeline quando um post novo é adicionado ao banco.

> Durante a criação de um post novo, caso a validação da presença do title e message não passem, ele exibe dinamicamente uma mensagem de erro indicando quais alterações devem ser feitas.

### 🏠 [Homepage](https://lucas-micro-blog.herokuapp.com/)

## Run tests

```sh
rspec
```

## Author

👤 **Lucas Kendi Fattore Hirano**

* Github: [@LucasKendi](https://github.com/LucasKendi)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_