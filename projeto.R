# Estudo de Caso - Projeto BigDataNaPratica (Machine Learning) - Contexto

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/11-Projeto-Teste_Qui_Quadrado-Registro_de_Imoveis")
getwd()



##########       Projeto Machine Learning - Teste Qui Quadrado       ########## 

# - Abordaremos o Teste do Qui-Quadrado para analisar e interpretar a relação entre variáveis categóricas.

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

# Trabalhamos com 2 hipóteses:

# -> Hipótese nula: As frequências observadas não são diferentes das frequências esperadas. Não existe diferença entre as
#    frequências (contagens) dos grupos. Portanto, não há associação entre os grupos.

# -> Hipótese  alternativa: As frequências observadas são diferentes das frequências esperadas, portanto existe diferença entre
#    as frequências. Portanto, há associação entre os grupos.



# Carregando pacotes



