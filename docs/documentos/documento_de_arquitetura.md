# Documento arquitetural

|        Data         |       Autor       |       Descrição da revisão        | Versão |
| :-----------------: | :---------------: | :-------------------------------: | :----: |
| 12 de julho de 2022 | **Danillo Souza** |     Inclusão da documentação      | 0.1.0  |
| 12 de julho de 2022 | **Danillo Souza** | Inclusão do diagrama arquitetural | 0.2.0  |
| 13 de julho de 2022 | **Danillo Souza** | Inclusão do tópico de tecnologias | 0.3.0  |
| 14 de julho de 2022 | **Lucas Boaventura** | Revisão do tópico de tecnologias atualizadas do projeto e suas referências | 0.4.0  |

## Introdução

A finalidade deste documento é detalhar as decisões arquiteturais do MeasureSoftGram utilizando diferentes visões arquiteturais, a fim de facilitar o entendimento dos processos envolvidos no desenvolvimento e todo o funcionamento do produto e além disso dar atualizar a [documentação original](https://fga-eps-mds.github.io/2021-2-MeasureSoftGram-Doc/docs/artifact/sad) do projeto.
Nesse documento, estão descritos os componentes, tecnologias e diferentes visões arquiteturais do MeasureSoftGram.

## Tecnologias

- **Python**: Linguagem de programação alto nível que possibilita a estabilidade de projetos que podem ser altamente escalaveis. Pode ser usada para criar interfaces simples no terminal de computadores.

- **JavaScript/TypeScript**: Linguagem de programação de alto nível que é interpretada estruturada. Juntamente com HTML e CSS, o JavaScript é uma das três principais tecnologias da World Wide Web. Utilizaremos o TypeScript que adiciona tipagem estática opcional no JavaScript.

### Frontend

- **React**: Framework em JavaScript e que possui suporte a TypeScript, desenvolvido pelo Facebook. Possibilita a criação de páginas web de forma simples e mais rápida que o clássico HTML, CSS e JavaScript.

- **Next.js**: Estrutura da web de desenvolvimento front-end React de código aberto criada por Vercel que permite funcionalidades como renderização do lado do servidor e geração de sites estáticos para aplicativos da web baseados em React.

### Backend

- **Django**: Framework open source baseado em Python. Desenvolvido com o intuito de reslver problemas comuns durante o desenvolvimento web. Altamente escalavel e robusto.

- **Jupyter Notebook**: É uma ferramenta open source que possibilita a criação e manipulação de Notebooks. Tecnologia baseada em Python.

### Banco de dados

- **PostgreSQL**: Sistema gerenciador de banco de dados relacionais de código aberto. Tem função de gerenciar dados de maneira organizada e eficaz.

<!-- TODO: Limitações arq -->

## Diagrama arquitetural

![Diagrama arquitetural](../assets/images/documento_de_arquitetura/diagramaArquitetural.png)

## Referência

[1] MARIOTTI, Flávio Secchieri; Como documentar a Arquitetura de Software. Disponível em: http://www.linhadecodigo.com.br/artigo/3343/como-documentar-a-arquitetura-de-software.aspx. Acessado em: 12/07/2022.

[2] CAVALCANTE, Pablo; Introdução a Typescript: o que é e como começar?. Disponível em: https://blog.geekhunter.com.br/introducao-a-typescript/. Acessado em 14/07/2022.

[3] ROVEDA, Ugo; O que é Django, para que serve e como usar este framework. Disponível em: https://kenzie.com.br/blog/djang/o. Acessado em: 13/07/2022.

[4] ROVEDA, Ugo; React: O que é, como funciona e porque usar e como aprender. Disponível em: https://kenzie.com.br/blog/react/. Acessado em: 13/07/2022.

[5] The React Framework for Production. Disponível em: https://nextjs.org/. Acessado em 14/07/2022.

[6] SOUZA, Ivan de; PostgreSQL: saiba o que é, para que serve e como instalar. Disponível em: https://rockcontent.com/br/blog/postgresql/. Acessado em: 13/07/2022.

[7] KRIGER, Kriger; O que é Python, para que serve e por que aprender?. Disponível em: https://kenzie.com.br/blog/o-que-e-python/. Acessado em: 13/07/2022.

[8] Jupyter Notebook: o que é e como usar. Disponível em: https://www.buscape.com.br/pc-computador/conteudo/jupyter-notebook-o-que-e-como-usar. Acessado em: 13/07/2022.