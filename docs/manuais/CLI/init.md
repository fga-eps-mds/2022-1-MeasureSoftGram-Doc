# Manual de uso do comando *init* na `CLI`

## Histórico de versão

| Data | Autor | Descrição da revisão | Versão |
| :--: | :---: | :------------------: | :----: |
| 17 de setembro de 2022 | **Hérick Portugues** | Criação do documento | 1.0.0 |

## Antes de começar

- Para instalar o measuresoftgram, rode o comando abaixo via terminal com o **python** e o **pip** instalados:

```bash
pip install measuresoftgram -U
```

---
## Comando init

Comando para criar um arquivo de inicialização com a organização, produto e repositórios do usuário.

### Passo 1

- Para visualizar a página de help do comando _init_, rode o comando:
```bash
measuresoftgram init --help
```

    ![Imagem do comando measuresoftgram  init --help](https://cdn.discordapp.com/attachments/1020837143792341075/1020837275770302565/Screenshot_from_2022-09-17_20-08-10.png)
    <figcaption style="text-align: center">Imagem 1. Exemplo do comando 'measuresoftgram init --help' da CLI</figcaption>

- Com isso é possível observar que o comando _init_ necessita do argumento *file_path*, que é o caminho para um arquivo configurado pelo usuário, com nome da organização, produto e uma lista com a url dos repositórios, como no exemplo abaixo:

```json
{
    "organization_name": "fga-eps-mds",
    "product_name": "MeasureSoftGram",
    "repositories": [
        "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-CLI",
        "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Service",
        "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Front",
        "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Core",
    ]
}
```

- É possível também passar o parâmetro opcional _--host_, especificando o host do microserviço Service, caso necessário.

- **Obs:** Caso esteja fazendo testes utilizando a instância do Service no heroku, é recomendando utilizar outros nomes de organizações, produtos e repositórios, pois há uma validação impendindo nomes iguais e os do exemplo acima já existem no banco de dados do Measuresoftgram.

### Passo 2

- Para testar o funcionamento do comando, rode:
```bash
measuresoftgram init <FILE_PATH>
```

    ![Imagem do comando measuresoftgram init](https://cdn.discordapp.com/attachments/1020837143792341075/1020841016342892614/Screenshot_from_2022-09-17_20-37-28.png)
    <figcaption style="text-align: center">Imagem 2. Exemplo do comando 'measuresoftgram init' da CLI</figcaption>

- Caso o comando funcione corretamente, assim como no exemplo da Imagem 2, é esperado que seja criado o arquivo _.measuresoftgram_ na mesmo diretório em que a CLI esteja rodando. O arquivo criado segue o padrão abaixo:

```json
{
    "organization": {
        "name": "fga-eps-mds",
        "id": 1
    },
    "product": {
        "name": "MeasureSoftGram",
        "id": 1
    },
    "repositories": [
        {
            "2022-1-MeasureSoftGram-CLI": 1
        },
        {
            "2022-1-MeasureSoftGram-Service": 2
        },
        {
            "2022-1-MeasureSoftGram-Front": 3
        },
        {
            "2022-1-MeasureSoftGram-Core": 4
        }
    ]
}
```

- Para verificar a criação da organização, produto e repositórios no sistema do measuresoftgram, basta acessar o endpoint *{SERVICE_HOST}/api/v1/organizations/*, em que *SERVICE_HOST* é a instância do service utilizada na execução do comando. Caso um host não tenha sido especificado, é possível verificar em: *https://measuresoftgram-service.herokuapp.com/api/v1/organizations/*. Pela própria navegação da api é possível clicar na url da organização recém-criada e acessar seus produtos e repositórios para conferir os ids.

### Validações

- Caso o arquivo de inicialização já exista, o comando aborta e mostra uma mensagem ao usuário falando que o arquivo já existe. Exemplo:

    ![Validação arquivo existente](https://cdn.discordapp.com/attachments/1020837143792341075/1020841015940219010/Screenshot_from_2022-09-17_20-34-43.png)
    <figcaption style="text-align: center">Imagem 4. Exemplo de validação caso arquivo '.measuresoftgram' já exista</figcaption>

- Além da validação do formato do arquivo (precisa ser JSON), é verificado o corpo do arquivo passado pelo usuário. Exemplos:

    - Arquivo não possui alguma das chaves necessárias (*organization_name*, *product_name* e *repositories*):

    ![Validação arquivo faltando chaves](https://cdn.discordapp.com/attachments/1020837143792341075/1020850913767858236/Screenshot_from_2022-09-17_21-07-51.png)
    <figcaption style="text-align: center">Imagem 5. Exemplo de validação de arquivo faltando chaves</figcaption>

    - Arquivo com *organização_name* ou *product_name* como strings vazias ou que não sejam strings:

    ![Validação arquivo com string inválida](https://cdn.discordapp.com/attachments/1020837143792341075/1020850914124378202/Screenshot_from_2022-09-17_21-09-22.png)
    <figcaption style="text-align: center">Imagem 6. Exemplo de validação de arquivo com string inválida</figcaption>

    - Arquivo com campo *repositories* não sendo uma lista de urls:

    ![Validação repositories precisa ser uma lista de urls](https://cdn.discordapp.com/attachments/1020837143792341075/1020850914455736440/Screenshot_from_2022-09-17_21-13-19.png)
    <figcaption style="text-align: center">Imagem 7. Exemplo de validação do campo repositories</figcaption>

    - Repositório com *url* inválida:

    ![Validação url do repositório](https://cdn.discordapp.com/attachments/1020837143792341075/1020850914866765884/Screenshot_from_2022-09-17_21-14-05.png)
    <figcaption style="text-align: center">Imagem 8. Exemplo de validação da url do repositório</figcaption>

- Atualmente o sistema do Measuresoftgram não aceita a criação de organizações, produtos ou repositórioes que possuam o mesmo nome de um outro já existente. Assim, é apresentado um erro caso o usuário tente criar uma dessas entidades com um nome que já exista. Exemplo:

    ![Validação de organização com nome existente](https://cdn.discordapp.com/attachments/1020837143792341075/1020852341685092413/Screenshot_from_2022-09-17_21-22-33.png)
    <figcaption style="text-align: center">Imagem 9. Exemplo de validação de organização com nome já existente</figcaption>
