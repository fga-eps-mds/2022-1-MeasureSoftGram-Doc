# Processos do projeto
## Histórico de versão
| Data | Versão | Modificação | Autor |
| ---- | ------ | ----------- | ----- |
| 01/07/2022 | 1.0.0 | Criação do documento | Hugo Sobral |

## Introdução

Este documento tem como objetivo definir e detalhar quais e como são aplicados os processos no projeto do MeasureSoftGram. O escopo do documento engloba desde a parte das metodologias adotadas assim como a forma que ocorre a interação entre os ritos das metodologias e o fluxo de trabalho da equipe.


## Metodologias

SCRUM

PAPÉIS DO SCRUM (ROTATIVOS)


## Ritos
### Planejamento

O planejamento é um rito que acontece internamente entre a equipe. Trata-se de uma reunião que precede o início de uma Sprint e, durante a execução da mesma, são definidos os objetivos que devem ser alcançados ao final da próxima sprint e quais são as atividades priorizadas para que tais objetivos venham a acontecer.

O planejamento é guiado pelo **Scrum Master** e suas atividades seguem a ordem:
- Discussão e alinhamento com o objetivo da sprint;
- Caso haja alguma mudança para o objetivo previsto, o backlog da sprint é atualizado de maneira conjunta e síncrona;
- Apresentação do backlog da sprint proposto.
É importante ressaltar que o **Scrum Master** em conjunto com o **Product Owner** devem preparar, previamente à reunião, uma proposta de objetivo e backlog da sprint.


### Revisão

A revisão é um rito que acontece em conjunto com o usuário. A revisão é uma reunião em que as tarefas desenvolvidas durante a sprint passada são apresentadas e demonstradas ao cliente. 

O funcionamento dessa reunião funciona a partir da demonstração de uma jornada de utilização das funcionalidades implementadas, feita por alguma pessoa do time de desenvolvimento. É importante ressaltar que essa apresentação e jornada deve ser preparada previamente pelo responsável por mostrar as funcionalidades. Os responsáveis são sortidos durante a sprint, para que seja possível manter uma equidade entre todos os membros da equipe.


### Retrospectiva

A retrospectiva é um rito que acontece internamente entre a equipe de desenvolvimento. A retrospectiva acontece ao final de cada sprint e funciona para:
- ressaltar os pontos positivos da sprint;
- salientar os pontos que precisam ser melhorados para as próximas sprints;
- levantar possíveis melhorias para o projeto como um todo.

A retrospectiva é uma reunião que é guiada pelo **Scrum Master** e que funciona como um ponto de controle para o andamento da equipe. A reunião consiste em uma etapa inicial em que todos os membros escrevem observações, por meio de post-its, sobre cada um dos três tópicos citados acima. Uma vez que o tempo estipulado para a escrita das observações acaba, cada um dos post-its é passado individualmente e discutido entre a equipe para aprofundar o ponto. A partir das dicussões levantadas, o time tem insumos para tomar decisões estratégicas e seguir o projeto da melhor maneira.


### Detalhamento de um item do backlog do produto até o backlog da sprint

Para fazer valer o primeiro e o segundo dos doze princípios do manifesto ágil, ```Nossa maior prioridade é satisfazer o cliente através da entrega contínua e adiantada de software com valor agregado.``` e ```Mudanças nos requisitos são bem-vindas, mesmo tardiamente no desenvolvimento. Processos ágeis tiram vantagem das mudanças visando vantagem competitiva para o cliente.```, foi pensado em fluxo de atividades e ritos para mitigar e agilizar eventuais mudanças que acontecem no escopo.

<object data="assets/images/fluxo_de_processos/especificacao_de_requisitos.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="assets/images/fluxo_de_processos/especificacao_de_requisitos.pdf">
        <p>Este navegador não suporta visualização de PDF's.</p>
    </embed>
</object>

No arquivo acima é mostrado como foi pensado o fluxo que uma história de usuário passa até ser incluída no backlog da sprint. Para tal, vale comentar que o backlog do produto vai ser evoluído de maneira iterativa e incremental, em conjunto com o andamento do projeto.

Em um primeiro momento, são definidas as especificações da descrição e de prototipação da história. Uma vez que estas terminam, dá-se início ao trabalho das especificações de negócio. As especificações de negócio podem ser entendidas como os ```critérios de aceite``` e serão apresentadas ao usuário durante a ```revisão de negócio```.

Uma vez que a história é aprovada pelo cliente, ela passa para o desenvolvimento de duas tarefas: o ```roteiro de testes``` e o ```detalhamento técnico```. Essas duas atividades são apresentadas para a equipe durante o ```refinamento técnico```. Após o último refinamento, uma história de usuário é devidamente inserida no backlog da sprint.


### Refinamento de negócio

O refinamento de negócio é uma reunião que acontece em conjunto com o cliente. Nesta reunião são apresentados os possíveis cenários de utilização e comportamento esperado pelo sistema para cada um dos cenários. Os cenários são descritos utilizando a notação do **Gherkin** e são apresentadas ao cliente pelo **Product Owner**.

Uma vez que está sendo utilizada uma linguagem de detalhamento de comportamentos, vale dizer que a abordagem para a especificação dos requisitos segue o desenvolvimento orientado a comportamentos (BDD).

### Refinamento técnico

O refinamento técnico é uma reunião interna em que as tarefas de cada história de usuário são apresentadas para a equipe. Entende-se como tarefa de uma história de usuário atividades técnicas que são necessárias para implementar os diferentes comportamentos especificados para o negócio. isto é, as histórias de usuário são divididas em tarefas atômicas que indicam os componentes necessários à implementação.

Durante o refinamento técnico, as pessoas responsáveis pela especificação de cada uma das atividades apresentam à equipe quais serão os passos necessários para a execução e implementação da atividade. A ideia é que as tarefas já estejam prontas e sejam somente propostas à equipe, caso alguma discussão aconteça, as tarefas são discutidas e podem ser modificadas de maneira síncrone e durante a reunião.