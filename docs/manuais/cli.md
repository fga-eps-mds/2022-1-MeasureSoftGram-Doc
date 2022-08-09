# Manual de uso do microsserviço `CLI`

## Histórico de versão

| Data | Autor | Descrição da revisão | Versão |
| :--: | :---: | :------------------: | :----: |
| 09 de agosto de 2022 | **Lucas Boaventura** | Criação do documento | 1.0.0 |

Passo a passo para teste das novas funcionalidades da CLI entregues até a R1.

- **F1**: Comando _get_ -> ```measuresoftgram get --help```

![Imagem do comando measuresoftgram get --help](https://media.discordapp.net/attachments/1005091228544684153/1006585817633919007/Captura_de_tela_de_2022-08-09_12-31-47.png)
<figcaption style="text-align: center">Imagem 1. Exemplo do helper do comando 'get' da CLI</figcaption>

---

- **F2**: Comando _import_ -> ```measuresoftgram import --help```

![Imagem do comando measuresoftgram import --help](https://media.discordapp.net/attachments/1005091228544684153/1006585818019799060/Captura_de_tela_de_2022-08-09_12-32-17.png)
<figcaption style="text-align: center">Imagem 2. Exemplo do helper do comando 'import' da CLI</figcaption>

## Antes de começar

- Rode o comando via terminal com o **python** e o **pip** instalados:

```bash
pip install measuresoftgram
```
---
## F1

Comando para fazer o get de determinados valores gravados de uma entidade da árvore.

Link de vídeo com uma visualização do uso: 

- [Visualização do uso do comando `get` do CLI measuresoftgram](https://www.youtube.com/watch?v=tJ4waG86kYE)
<figcaption style="text-align: center">Vídeo 1. Vídeo sobre a funcionalidade 'get'</figcaption>

#### Passo 1

- Visualizar a página de help descrita na imagem 1.
- Nela você pode observar que o comando _get_ aceita as entidades metrics e measures.
- Um parâmetro opcional _entity id_, caso ele não seja especificado será listado todos os últimos valores das entidades válidas.
- Alguns parâmetros opcionais como: 
  - _--output-format_: json ou tabular.
  - _--host_: O host do service, caso seja necessário.
  - _--history_: O histórico das _metrics_ ou _measures_ (ainda finalizando a implementação).
  - _--organization-id_: Para especificar de qual organização está sendo buscado os dados.
  - _--repository-id_:  Para especificar de qual repositório está sendo buscado os dados.

#### Passo 2

- Rodar o comando:
```bash
measuresoftgram get measures
```

![Imagem do comando measuresoftgram get measures](https://media.discordapp.net/attachments/1005091228544684153/1006590337541738546/Captura_de_tela_de_2022-08-09_12-49-58.png)
<figcaption style="text-align: center">Imagem 3. Exemplo do comando 'get measures' da CLI</figcaption>

#### Passo 3

- Rodar o comando:
```bash
measuresoftgram get metrics
```

![Imagem do comando measuresoftgram get metrics](https://media.discordapp.net/attachments/1005091228544684153/1006590337919238265/Captura_de_tela_de_2022-08-09_12-50-16.png?width=1287&height=660)
<figcaption style="text-align: center">Imagem 4. Exemplo do comando 'get metrics' da CLI</figcaption>

#### Passo 4

- Rodar o comando:
```bash
measuresoftgram get metrics 1
```

![Imagem do comando measuresoftgram get metrics 1](https://media.discordapp.net/attachments/1005091228544684153/1006591275392323734/Captura_de_tela_de_2022-08-09_12-53-57.png)
<figcaption style="text-align: center">Imagem 5. Exemplo do comando 'get metrics 1' da CLI</figcaption>

#### Passo 5

- Rodar o comando:
```bash
measuresoftgram get measures 1
```

![Imagem do comando measuresoftgram get measures 1](https://media.discordapp.net/attachments/1005091228544684153/1006591275711086673/Captura_de_tela_de_2022-08-09_12-54-04.png)
<figcaption style="text-align: center">Imagem 6. Exemplo do comando 'get measures 1' da CLI</figcaption>

#### Passo 6

- Rodar o comando:
```bash
measuresoftgram get measures 1 --output_format=json
```

![Imagem do comando measuresoftgram get measures 1 --output_format=json](https://media.discordapp.net/attachments/1005091228544684153/1006592349322878976/Captura_de_tela_de_2022-08-09_12-58-14.png)
<figcaption style="text-align: center">Imagem 7. Exemplo do comando 'get measures 1 --output_format=json' da CLI</figcaption>

---
## F2

Comando para fazer o import de um diretório de arquivos advindos de terceiras ferramentas de análise de código. Para esta funcionalidade está habilitado somente o '_import sonarqube_'.

Ele ignora os arquivos sem extensão _.json_ e inváilidos de acordo com o padrão do **sonarqube**. E caso haja falha em uma requisição para salvar o arquivo ele tenta até três vezes antes de passar para o próximo.

Link de vídeo com uma visualização do uso: 

- [Visualização do uso do comando `import` do CLI measuresoftgram](https://www.youtube.com/watch?v=nlQUNfBRwtI)
<figcaption style="text-align: center">Vídeo 2. Vídeo sobre a funcionalidade 'import'</figcaption>

#### Passo 1

- Visualizar a página de help descrita na imagem 2.
- Nela você pode observar que o comando _import_ aceita somente um **output_origin**, que é o _sonarqube_.
- Um parâmetro chamado _dir path_, para endereçar o caminho relativo do diretório que contém os arquivos de output do sonar para serem coletados.
- Um parâmetro chamado _language extension_, para especificar a extensão dos arquivos a serem analisados dentro do projeto (Uma das melhorias previstas é a passagem de uma lista de extensão de arquivos a serem analisados pelo _measuresoftgram_).
- Alguns parâmetros opcionais como:
  - _--host_: O host do service, caso seja necessário.
  - _--organization-id_: Para especificar de qual organização está sendo buscado os dados.
  - _--repository-id_:  Para especificar de qual repositório está sendo buscado os dados.

#### Passo 2

- Rodar o comando passando um diretório com arquivos json válidos de output do sonar:
```bash
measuresoftgram import sonarqube <DIR PATH> py
```

![Imagem do comando measuresoftgram import sonarqube <DIR PATH>](https://media.discordapp.net/attachments/1005091228544684153/1006596410122194994/Captura_de_tela_de_2022-08-09_13-11-45.png?width=1802&height=660)
<figcaption style="text-align: center">Imagem 8. Exemplo do comando 'import sonarqube DIR_PATH py' da CLI</figcaption>

#### Passo 3

- Rodar o comando passando um diretório com arquivos json válidos de output do sonar:
```bash
measuresoftgram import sonarqube <DIR PATH> py --host=http://localhost:2503
```

![Imagem do comando measuresoftgram --host=http://localhost:2503](https://media.discordapp.net/attachments/1005091228544684153/1006596409690173530/Captura_de_tela_de_2022-08-09_13-14-29.png?width=1266&height=660)
<figcaption style="text-align: center">Imagem 4. Exemplo do comando 'import sonarqube DIR_PATH py --host=http://localhost:2503' da CLI</figcaption>
