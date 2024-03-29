# Manual de uso do microsserviço `Service`

## Histórico de versão

| Data | Autor | Descrição da revisão | Versão |
| :--: | :---: | :------------------: | :----: |
| 09 de agosto de 2022 | **Durval Carvalho** | Criação do documento | 1.0.0 |


## O que é o microsserviço `service`

O `service` é o microsserviço da solução MeasureSoftGram que possui várias funcionalidades relacionadas com a persistência de dados e acesso aos dados salvos.

Por meio de sua API é possível recuperar dados históricos e solicitar o cálculo de novos dados. E é por meio desta API que os demais serviços da solução (CLI e o Dashboard) obtém seus dados.

## Como usar a API do microsserviço `service`?

Atualmente o serviço `service` já está disponível no Heroku na seguinte URL:

* `Service`: https://measuresoftgram-service.herokuapp.com
* `Core`: https://measuresoftgram-core.herokuapp.com

Deste modo todos os comandos que serão apresentados a seguir podem ser executados utilizando esta instância do software que se encontra disponível no Heroku. Porém, caso você queria executar todo o software localmente é possível da seguinte maneira:

```bash
# Clone o repositório `core`
$ git clone https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Core

# Entre no repositório `core` e suba os containers
# Observe que aqui estamos usando o `docker compose`, certifique-se que esta ferramenta está devidamente instalada
$ cd 2022-1-MeasureSoftGram-Core && docker compose up

# Clone o repositório `service`
$ https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Service

# Entre no repositório `service` e suba os containers
$ cd 2022-1-MeasureSoftGram-Service && docker compose up
```

Após essa sequência de comandos, os serviços estarão rodando localmente nas seguintes portas:

* `Service`: http://localhost:8080
* `Core`: http://localhost:7000


```bash

# Defina as variáveis de ambiente da instância do software

# Se for usar as instância no Heroku use os comandos abaixo
$ export MSG_SERVICE=https://measuresoftgram-service.herokuapp.com
$ export MSG_CORE=https://measuresoftgram-core.herokuapp.com

# Se for usar as instâncias rodando localmente use os comandos abaixo
$ export MSG_SERVICE=http://localhost:8080
$ export MSG_CORE=http://localhost:7000
```

**Observação:** As funcionalidades disponíveis nas API serão apresentadas utilizando a linguagem de programação Python3. Caso não tenha o python instalado ou caso não queira testar as funcionalidades utilizando o Python3, também é possível por meio do Postman, utilizando a seguinte Collection de requisições:

* `Convite para a Collection do Postman`: https://www.postman.com/bold-space-281583/workspace/measuresoftgram/collection/10503200-b9b9a474-ed9c-43e0-a3d3-9aa6289bb53f?action=share&creator=10503200

* Caso prefira importar a Collection para uma instância do Postman rodando localmente, basta seguir o vídeo a seguir:

* Tutorial de como importar uma collection: https://youtu.be/LdhKXkbrBt8
* Link da collection:

## Funcionalidades

### Detalha um repositório criado na MeasureSoftGram

Atualmente o `service' possui fixado somente um repositório e uma organização. Mas futuramente o endpoint irá funcionar da mesma maneira porém com vários repositórios e organizações.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"
if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183729046-3fb0923b-1342-42e9-9889-51e704ec4735.png'>
    <figcaption align='center'>
        <b>Figura 1: Resultado esperado 1</b>
    </figcaption>
</p>


### Lista as métricas atualmente suportadas pelo MeasureSoftGram

Esse endpoint lista todas as métricas que o MeasureSoftGram suporta. E quando falamos suportar estamos falando de armazenar valores coletados de diversas fontes, sendo as fontes atuais os JSONs do SonarQube e a API do GitHub.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/supported-metrics/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183729564-ff2d6efa-3ed9-4bef-a767-b8f7e76fb6fb.png'>
    <figcaption align='center'>
        <b>Figura 2: Resultado esperado 2</b>
    </figcaption>
</p>


### Lista as medidas atualmente suportadas pelo MeasureSoftGram

Endpoint que lista as medidas que o MeasureSoftGram suporta. E quando falamos suportar queremos dizer as medidas que o software é capaz de calcular.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"
if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/supported-measures/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```
<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183730483-3731e34c-5a67-4793-9954-cfd2bcc6b02b.png'>
    <figcaption align='center'>
        <b align='center'>Figura 3: Resultado esperado 3</b>
    </figcaption>
</p>


### Lista as subcaracterísticas atualmente suportadas pelo MeasureSoftGram

Endpoint que lista as subcaracterísticas que o MeasureSoftGram suporta. E quando falamos suportar queremos dizer as subcaracterísticas que o software é capaz de calcular.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"
if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/supported-subcharacteristics/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183731222-c1a79f4d-ff9e-4cd3-9049-9731d1e7de77.png'>
    <figcaption align='center'>
        <b align='center'>Figura 4: Resultado esperado 4</b>
    </figcaption>
</p>


### Lista as características atualmente suportadas pelo MeasureSoftGram

Endpoint que lista as características que o MeasureSoftGram suporta. E quando falamos suportar queremos dizer as características que o software é capaz de calcular.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"
if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/supported-characteristics/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```
<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183731642-0fda45c8-6406-4247-9bf3-51496a6def36.png'>
    <figcaption align='center'>
        <b align='center'>Figura 5: Resultado esperado 5</b>
    </figcaption>
</p>


### Lista o último valor das métricas coletadas para um determinado repositório

Endpoint que lista todas as métricas coletadas de um determinado repositório. Neste endpoint é possível obter o último valor de cada métrica.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"
if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/metrics/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```


<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183732318-ad698622-383a-47cb-badd-afd944f91302.png'>
    <figcaption align='center'>
        <b align='center'>Figura 6: Resultado esperado 6</b>
    </figcaption>
</p>


### Lista o último valor das medidas calculadas para um determinado repositório

Endpoint que lista todas as medidas coletadas de um determinado repositório. Neste endpoint é possível obter o último valor de uma determinada medida.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/measures/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183733250-e523ce3a-0536-48f3-99e4-0830f8c0050d.png'>
    <figcaption align='center'>
        <b align='center'>Figura 7: Resultado esperado 7</b>
    </figcaption>
</p>

### Lista o último valor das subcaracterísticas calculadas para um determinado repositório

Endpoint que lista todas as subcaracterísticas coletadas de um determinado repositório. Neste endpoint é possível obter o último valor de uma determinada subcaracterística.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/subcharacteristics/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183733761-046a6fe0-5172-4832-9099-ccad72b5a5d4.png'>
    <figcaption align='center'>
        <b align='center'>Figura 8: Resultado esperado 8</b>
    </figcaption>
</p>



### Lista o último valor das características calculadas para um determinado repositório

Endpoint que lista todas as características coletadas de um determinado repositório. Neste endpoint é possível obter o último valor de uma determinada característica.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/characteristics/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183734093-03a38fc1-5fe3-4eac-9698-0418e16821ef.png'>
    <figcaption align='center'>
        <b align='center'>Figura 9: Resultado esperado 9</b>
    </figcaption>
</p>



### Lista os valores calculados do SQC em ordem decrescente (do mais recente para o mais antigo)

Endpoint que lista o histórico de valores que o SQC de um repositório em ordem decrescente, ou seja, do SQC mais recente para o mais antigo.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/sqc/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```


<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183734798-d0cd1c62-e029-4ad5-90f8-39433b67f62e.png'>
    <figcaption align='center'>
        <b align='center'>Figura 10: Resultado esperado 10</b>
    </figcaption>
</p>




### Apresenta a pré-configuração vigente de um repositório

Endpoint que apresenta a pré-configuração vigente de um repositório.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/current-pre-config/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183735147-10de168e-b367-4a51-899e-502169b2d03e.png'>
    <figcaption align='center'>
        <b align='center'>Figura 11: Resultado esperado 11</b>
    </figcaption>
</p>


### Lista o histórico de valores coletados das métricas de um repositório

Endpoint que lista os últimos 50 registros de valores coletados das métricas de um repositório.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/history/metrics/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

### Lista o histórico de valores calculados das medidas de um repositório

Endpoint que lista os últimos 50 registros de valores calculados das medidas de um repositório.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/history/measures/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```
### Lista o histórico de valores calculados das subcaracterísticas de um repositório

Endpoint que lista os últimos 50 registros de valores calculados das subcaracterísticas de um repositório.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/history/subcharacteristics/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

### Lista o histórico de valores calculados das características de um repositório

Endpoint que lista os últimos 50 registros de valores calculados das características de um repositório.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/history/characteristics/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

### Recebe um arquivo do SonarQube para salvar como métricas de um repositório

Endpoint que recebe um JSON do SonarQube e importa as métricas contidas e associa ao repositório.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/current-pre-config/", payload, headers)
res = conn.getresponse()
data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183737211-532c1fe1-5994-4698-ad9a-1aecdd48e15d.png'>
    <figcaption align='center'>
        <b align='center'>Figura 11: Resultado esperado 11</b>
    </figcaption>
</p>


### Coleta métricas do GitHub

Endpoint que recebe recebe os parâmetros necessários para coletar as seguintes métricas na API do GitHub:

* `total_number_of_issues_in_the_last_x_days`: Essa métrica depende dos parâmetros `github_token`, `issues_repository_url`, `issues_metrics_x_days`, `issue_labels`.

* `number_of_resolved_issues_in_the_last_x_days`: Essa métrica depende dos parâmetros `github_token`, `issues_repository_url`, `issues_metrics_x_days`, `issue_labels`.

* `runtime_sum_of_build_pipelines_in_the_last_x_days`: Essa métrica depende dos parâmetros `github_token`, `pipelines_repository_url`, `pipeline_metrics_x_days`, `build_pipeline_names`.

* `number_of_build_pipelines_in_the_last_x_days`: Essa métrica depende dos parâmetros `github_token`, `pipelines_repository_url`, `pipeline_metrics_x_days`, `build_pipeline_names`.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)


print("Digite um Token de acesso a API do Github:")
print("Caso você não tenha um, crie um novo usando o seguinte link. Lembre-se o token criado não precisa de nenhuma permissão. Link: https://github.com/settings/tokens")

github_token = input()

payload = json.dumps({
  "github_token": github_token,
  "issues_repository_url": "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Doc",
  "pipelines_repository_url": "https://github.com/fga-eps-mds/2022-1-MeasureSoftGram-Service",
  "issues_metrics_x_days": 7,
  "pipeline_metrics_x_days": 90,
  "issue_labels": [
    "bug",
    "problema"
  ],
  "build_pipeline_names": [
    "Run Tests",
    "build"
  ]
})
headers = {
  'Content-Type': 'application/json'
}
conn.request("POST", "/api/v1/organizations/1/repository/1/import/github-metrics/", payload, headers)
res = conn.getresponse()

data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```



### Coleta o valor de uma determinada métrica para um determinado repositório

Caso o usuário do sistema deseje coletar determinada métrica "manualmente", e quando falamos manualmente estamos se referindo ao fato do sistema não ter suporte a fonte de dados que o usuário deseja coletar (atualmente temos suporte ao SonarQube e ao GitHub), ele poderá utilizar esse endpoint especificando o id da métrica e seu respectivo valor.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)


payload = json.dumps({
  "metric_id": 78,
  "value": 14
})
headers = {
  'Content-Type': 'application/json'
}
conn.request("POST", "/api/v1/organizations/1/repository/1/create/metrics/", payload, headers)
res = conn.getresponse()

data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))

```


### Solicita o cálculo de uma determinada medida para um determinado repositório

Por meio desse endpoint o usuário poderá solicitar o cálculo de uma ou mais medida.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)


payload = json.dumps({
  "measures": [ { "key": "passed_tests" },
                { "key": "test_builds" },
                { "key": "test_coverage" },
                { "key": "commented_file_density" },
                { "key": "duplication_absense" },
                { "key": "non_complex_file_density" },
                { "key": "team_throughput" },
                { "key": "ci_feedback_time" } ]
})
headers = {
  'Content-Type': 'application/json'
}
conn.request("POST", "/api/v1/organizations/1/repository/1/calculate/measures/", payload, headers)
res = conn.getresponse()

data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183739262-5963ce90-b82a-4bf2-aa7e-0f34df31232f.png'>
    <figcaption align='center'>
        <b align='center'>Figura 12: Resultado esperado 12</b>
    </figcaption>
</p>




### Solicita o cálculo de uma determinada subcaracterísticas para um determinado repositório

Por meio desse endpoint o usuário poderá solicitar o cálculo de uma ou mais subcaracterísticas.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)


payload = json.dumps({
  "subcharacteristics": [ { "key": "testing_status" },
                { "key": "modifiability" } ]
})
headers = {
  'Content-Type': 'application/json'
}
conn.request("POST", "/api/v1/organizations/1/repository/1/calculate/subcharacteristics/", payload, headers)
res = conn.getresponse()

data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183739602-499d3004-8f97-49b6-908f-edee08dccc1b.png'>
    <figcaption align='center'>
        <b align='center'>Figura 13: Resultado esperado 13</b>
    </figcaption>
</p>


### Solicita o cálculo de uma determinada características para um determinado repositório

Por meio desse endpoint o usuário poderá solicitar o cálculo de uma ou mais características.

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)


payload = json.dumps({
  "characteristics": [ { "key": "maintainability" },
                       { "key": "reliability" } ]
})
headers = {
  'Content-Type': 'application/json'
}
conn.request("POST", "/api/v1/organizations/1/repository/1/calculate/characteristics/", payload, headers)
res = conn.getresponse()

data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183753387-bf4ffeaa-902f-47aa-a70e-94f798bdc79e.png'>
    <figcaption align='center'>
        <b align='center'>Figura 14: Resultado esperado 14</b>
    </figcaption>
</p>

<!--
### Solicita o cálculo do SQC de um determinado repositório

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

if 'https://' in URL:
    URL = URL.replace('https://', '')
    conn = http.client.HTTPSConnection(URL)

elif 'http://' in URL:
    URL = URL.replace('http://', '')
    conn = http.client.HTTPConnection(URL)

conn.request("POST", "/api/v1/organizations/1/repository/1/calculate/sqc/")
res = conn.getresponse()

data = res.read().decode()
data = json.loads(data)

print(json.dumps(data, indent=4))
```

<p align='center'>
    <img src='https://user-images.githubusercontent.com/31013187/183753387-bf4ffeaa-902f-47aa-a70e-94f798bdc79e.png'>
    <figcaption align='center'>
        <b align='center'>Figura 14: Resultado esperado 14</b>
    </figcaption>
</p>
-->