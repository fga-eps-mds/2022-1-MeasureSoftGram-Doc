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

## Funcionalidades

### Detalha um repositório criado na MeasureSoftGram

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
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

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
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

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
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

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
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

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
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

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
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

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
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

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
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

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
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

```python
import http.client
import json
import os

URL = os.getenv('MSG_SERVICE')

if not URL:
    URL = "measuresoftgram-service.herokuapp.com"

URL = URL.replace('https://', '').replace('http://', '')

conn = http.client.HTTPSConnection(URL)
payload = ''
headers = {}
conn.request("GET", "/api/v1/organizations/1/repository/1/sqc/", payload, headers)
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




