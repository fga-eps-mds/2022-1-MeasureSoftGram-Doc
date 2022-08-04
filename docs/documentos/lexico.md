# Léxico

## **Histórico de revisões**
|Data|Versão|Descrição|Autor|
|:---|:---|:---|:---|
| 25/07/2022 | 1.0 | Criação do artefato base| Victor Amaral |
| 04/08/2022 | 1.1 | Revisão do documento | Durval Carvalho |

## 1. **Introdução**

Léxico, por definição na linguística, é o repertório de palavras existentes numa determinada língua. Dentro de um escopo completamente diferente da linguística clássica, a engenharia de requisitos, o léxico é um artefato intrinsecamente importante num projeto de software, para que todos os vocábulos, ou seja, expressões oriundas do contexto em que esse software esteja inserido, sejam devidamente catalogados e definidos.<br>
Os símbolos são definidos da seguinte forma:

<br> - **Noção**: é o que significa (denotação).
<br> - **Impacto**: descreve o efeito/uso/ocorrência do símbolo na aplicação ou no efeito de algo na aplicação sobre ele (conotação).
<br> - **Classificação**: estado, verbo ou objeto.
<br> - **Sinônimos**: símbolos/palavras diferentes que possuem significado similar ou idêntico. Opcional.

## 2. **Objetivo**

O objetivo de se ter um documento de léxico, durante esse processo de modelagem de requisitos, é que a equipe de desenvolvimento e possíveis clientes e ou responsáveis pelo negócio, de maneira direta e denotativa, falem na mesma língua, ou seja, se entendam melhor, dentro do contexto do projeto.<br>

É interessante salientar que esse é um artefato altamente mutável, portanto ele pode e deve ser alterado diversas vezes ao longo do desenvolvimento, conforme novos vocábulos surjam.

## 3. **Metodologia**
Utilizaremos o modelo de tabela abaixo para registrar e definir cada palavra ao léxico:<br>

### **Símbolo**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Objeto/Estado/Verbo | Denotação | Conotação | Opcional |

## 4. **Vocábulos**

### **Equalizador**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Objeto | Ferramenta gráfica disponível no dashboard do software para definir as "metas" de qualidade para a próxima release. | Por meio dessa ferramenta que o usuário será capaz de definir o que se espera atingir no final do ciclo de desenvolvimento, sendo assim um componente chave para a utilização do sistema. | - |

### **Pré-Configuração**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Estado | Conjunto de definições necessárias para o calcular todas as entidades do modelo. | Por meio da pré-configuração que é definido quais características, subcaracterísticas e medidas serão consideradas para mensurar a qualidade do software analisado. Na pré-configuração também é definido os pesos de cada uma das entidades definidas. | - |

### **Configuração**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Estado | A configuração da release é também a meta de qualidade que se espera atingir na próxima release. | Por meio do equalizador o usuário será capaz de definir a configuração de qualidade. | - |

### **Repositório**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Verbo | Repositório de código-fonte | Refere-se a um repositório de código fonte no sistema MeasureSoftGram. Esse repositório não irá armazenar o código fonte do projeto, mas sim o seu histórico de qualidade. | Projeto |

### **Organização**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Verbo | Agrupamento de vários projetos e seus participantes | Por meio de uma organização é possível criar um grupo de pessoas que têm acesso a um ou masi projetos. Sendo possível adicionar ou remover tanto pessoas quanto projetos. | - |

### **Característica**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Objeto | Categoria de qualidade interna/extarna de um software | Variáveis do equalizador definidas na pré-configuração que indicam quais características do software avaliado serão analisadas | - |

### **Subcaracterística**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Objeto | Conjunto de atributos mensuráveis que definem uma característica | Atributos que compõem uma característica que será exibida no relatório do cálculo matematíco realizado | - |

### **Pesos**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Objeto | Variável de impacto de cada subcaracterística | Valor variável referente ao impacto de cada subcaracterística para o resultado final do cálculo realizado pelo modelo matemático de cada característica | - |

### **Matriz de correlação entre característica**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Objeto | Matriz de Correlação entre diversas definições do modelo matemático do software. | Matriz que representa como as medidas selecionadas no equalizador relacionam-se de forma proporcional, inversamente proporcional, neutra ou inconclusiva. | - |

### **Medidas**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Objeto | Interpretação de uma medida ou conjunto de métricas. | Interpretação utilizada para determinar a qualidade de um projeto em relação a uma determinada sub-característica | - |

### **Métrica**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Objeto | Dado obtido de uma fonte externa (SonarQube, GitHub, Jira, etc.) | Medidas são usadas em uma fórmula que calcula as métricas. | - |

### **Fórmula**
| Classificação | Noção | Impacto | Sinônimos |
| --- | --- | --- | --- |
| Objeto | Conjunto de operações matemáticas para calcular uma nota. | Fórmulas serão utilizadas para o relatório final de notas do calculo do modelo matemático. | - |

## 5. **Referências**

1. [Zowghi, D.; Coulin, C._Requirements Elicitation: A Survey of Techniques, Aproaches and Tools_.](https://web.eecs.umich.edu/~weimerw/2018-481/readings/requirements.pdf) Acesso em: 25/07/2022.
