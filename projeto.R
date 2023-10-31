# Estudo de Caso - Projeto BigDataNaPratica (Machine Learning) - Contexto

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/11-Projeto-Teste_Qui_Quadrado-Registro_de_Imoveis")
getwd()



##########       Projeto Machine Learning - Teste Qui Quadrado       ########## 

# - Abordaremos o Teste do Qui-Quadrado para analisar e interpretar a relação entre variáveis categóricas (qualitativas).

# - Considere um conjunto de dados com registros de imóveis em diversas cidades pelo Brasil. Cada registro contém informações
#   como preço do imóvel, tamanho, tipo do imóvel, status do imóvel, se está ou não alugado, entre outras informações.

# - Nosso trabalho será checar se duas das variáveis (ambas categóricas) estão relacionadas e impactam a informação geral
#   disponível no dataset. Aplicaremos um teste estatístico indicado para variáveis categóricas, o Teste do Qui-Quadrado.

# - Para este trabalho estaremos usando um conjunto de dados fictício.


# - Qui-Quadrado, simbolizado por χ2, é um teste de hipóteses que se destina a encontrar um  valor  da  dispersão  para  duas
#   variáveis  nominais,  avaliando  a  associação  existente  entre variáveis qualitativas.
# - É um teste não paramétrico, ou seja, não depende dos parâmetros populacionais, como média e variância.
# - O princípio básico deste método é comparar proporções, isto é, as possíveis divergências entre as frequências observadas e
#   esperadas para um certo evento. 
# - Evidentemente, pode-se dizer que dois grupos se comportam de forma semelhante se as diferenças  entre  as  frequências 
#   observadas e as esperadas em cada categoria forem muito pequenas, próximas a zero. Ou seja, se a probabilidade é muito baixa,
#   ele fornece fortes evidências de que as duas variáveis estão associadas.

# Trabalharemos com 2 hipóteses:

# -> Hipótese nula: As frequências observadas não são diferentes das frequências esperadas. Não existe diferença entre as
#    frequências (contagens) dos grupos. Portanto, não há associação entre os grupos.

# -> Hipótese  alternativa: As frequências observadas são diferentes das frequências esperadas, portanto existe diferença entre
#    as frequências. Portanto, há associação entre os grupos.



# Carregando pacotes

library(tidyverse) # manipulação de dados
library(dplyr)     # manipulação de dados
library(corrplot)  # criar gráfico de mapa de correlação
library(ggplot2)   # criar outros gráficos (especificamente de dispersão)
library(caret)     # usado em tarefas de classificação e regressão para simplificar o processo de treinamento de modelos




# Carregando e interpretando os dados

dados <- as.data.frame(read_csv("dados.csv"))

head(dados)
View(dados)

# - Cada linha representa um imóvel.
# - Observando as variávels "Tipo_Imovel" e "Status_Imovel", podemos considerar que elas tem alguma relação?
#   Isso poderia inclusive explicar as variáveis "Preco" ou "Status_Imovel" ?
# - Para responder esta pergunta, teremos que aplicar um teste estatístico.

# - Porém, estas variáveis são do tipo categóricas (ou seja, elas possuem classes/categorias) e por conta disso precisaremos
#   de um teste estatístico apropriado para este tipo de dado. E para este exemplo, o Teste do Qui Quadrado é o ideal.
#   Lembrando que este não é o único teste para variáveis categóricas (mas é um dos mais comuns e úteis)

# - Problema de negócio -> Há alguma associação entre as variáveis "Tipo_Imovel" e "Status_Imovel" ?
#                          Caso haja uma relação, é provável que explique "Preco" ou "Status_Imovel".
#                          E caso não haja relação? Isso ainda explicaria "Preco" ou "Status_Imovel" ?

# - No fim das contas estamos interpretando/compreendendo os dados como estão organizados. Logo, iremos aplicar um teste para
#   verificar se duas variáveis categóricas estão ou não relacionadas e com base neste resultado iremos compreender um pouco
#   melhor "Preco" e "Status_Aluguel". Resumindo: iremos fazer uma rápida análise exploratória, aplicar o teste e interpreta-lo.

# - O mais importante é a interpretação do teste!


# - Voltando a olhar nossos dados precisamos lembrar semrpe que:

# -> Todo teste estatístico pode ter uma ou mais suposições.

# -> No caso do Teste do Qui Quadrado a suposição mais importante é: as variáveis devem ser independentes!

# -> Agora ao observar nosso dados novamente, a pergunta é: as variáveis "Tipo_Imovel" e "Status_Imovel" são independentes?
#    Como um "Tipo_Imovel" pode ser "antigo" ou "novo" tal como em "Status_Imovel", isso signifca que as variáveis são sim
#    independentes.



#### Análise Exploratória dos Dados


# verificando valores ausentes nas colunas
colSums(is.na(dados))

# Dimensões (nº de linhas e colunas)
dim(dados)

# Verificando tipos de dados
str(dados)

# Sumário estatístico
summary(dados)



# Extraindo as variáveis para x e y
# (divisão é feita para preparar as variáveis "x" e "y" que serão usadas no teste Qui-Quadrado para avaliar a associação
# entre "Tipo_Imovel" e "Status_Imovel". )

x = dados$Tipo_Imovel
head(x)
unique(x)

y = dados$Status_Imovel
head(y)
unique(y)


# Calculando tabela cruzada (ou tabela de contingência) com as variáveis x ("Tipo_Imovel") e y ("Status_Imovel")

# - Isso é feito para cruzar cada categoria de uma variável com as categorias de outra variável.
#   No nosso caso tempos 2901 Apartamentos Antigos e 990 Novo

table(x, y)

# Observando valores acima em porcentual (arrdondado para 3 casas decimais)

round(prop.table(table(x, y)), 3)



## Definindo as Hipóteses (só assim conseguiremos interpretar os resultados, caso contrário serão apenas números)

# Hipótese Nula        - H0 -> Não há relação entre x e y
# Hipotese Alternativa - H1 -> Há relação entre x e y

# Ou seja, se o valor-p for menor que 0.05, rejeitaremos a H0


## Teste do Qui-Quadrado

chisq.test(table(x, y))

# 	Pearson's Chi-squared test

# data:  table(x, y)
# X-squared = 868.75, df = 4, p-value < 2.2e-16


## Interpretando o resultado do teste

# Com base nesses resultados, podemos interpretar da seguinte forma:
  
# - A hipótese nula (H0), que afirma que não há relação entre as variáveis "Tipo_Imovel" e "Status_Imovel", é rejeitada.
# - O valor-p extremamente baixo (p-value < 0.05) indica que há uma relação estatística significativa entre as variáveis
#   "Tipo_Imovel" e "Status_Imovel."

# Portanto, com base no resultado do teste Qui-Quadrado, podemos afirmar que existe uma associação significativa entre o
# tipo de imóvel ("Tipo_Imovel") e o status do imóvel ("Status_Imovel"). Isso significa que essas duas variáveis não são
# independentes, e há uma relação estatisticamente significativa entre elas.



## Proposta de Exercício

# - Se não considerarmos os imóveis do tipo Apartamento, há diferença no resultado do teste ?

# Antes de responder, devemos questionar porque o problema de negócio é retirar "Apartamento", e observando novamente a
# tabela cruzada podemos observar que a categoria "Apartamento" é a que tem a maioria dos registros, muito maior que outra
# categoria, logo é provável que "Apartamento" esteja influenciando no teste e por isso iremos checar sem os registro de 
# "Apartamento".

# Respota: Sim, pois os argumentos devem ter o mesmo comprimento, logo terei que remover linhas de y e isso irá influenciar
#          o resultado.



# Removendo categoria "Apartamento" de "Tipo_Imovel"

dim(dados)
dados2 <- droplevels(subset(dados, Tipo_Imovel != "Apartamento"))
dim(dados2)


# Extraindo as variáveis para x e y
x2 = dados2$Tipo_Imovel
y2 = dados2$Status_Imovel


# Criando tabela cruzada
table(x2, y2)


## Aplicando Teste Qui Quadrado
chisq.test(table(x2, y2))


# Pearson's Chi-squared test

# data:  table(x2, y2)
# X-squared = 0.79718, df = 3, p-value = 0.8501

# - O valor-p é maior que 0.05. Falhamos em rejeitar a H0.
#   Com isso, neste cenário onde foi removido todos os imóveis do tipo "Apartamento", as variáveis "Tipo_Imovel" e 
#   "Status_Imovel" não tem relação estatististicamente significativa.








