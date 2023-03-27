### analise da PMS - pesquisa mensal de comercio (marco, 2020)
### modelagem Arima
### autor: Paulo Roberto Carneiro de Sá

# pacotes necessarios:
library(BETS)
library(dygraphs)
library(ggplot2)
library(fpp2)
library(FitAR)
library(tseries)
library(forecast)

#########################################################################################################

servicoma <- BETSget(27986) 
print(servicoma)
class(servicoma)

servicoma2<- ts(servicoma [2], start= c(2011, 1), end = c(2020,3), frequency = 12)
print(servicoma2)
class(servicoma2)
plot(servicoma2)

dservico <- diff(servicoma2)

# estatisticas basicas
summary(servicoma2)

### plot basico lembrar que em class(), ele já indicou que era ts = serie
# temporal
plot(servicoma2)

# pelo pacote dygraph dá mais opções
library(dygraphs)
help("dygraph")

dygraph(servicoma2, main = "Pesquisa mensal de serviços - IBGE") %>% 
  dyAxis("x", drawGrid = TRUE) %>% dyEvent("2011-1-01", "2011", labelLoc = "bottom") %>% 
  dyEvent("2015-1-01", "2015", labelLoc = "bottom") %>% dyEvent("2018-1-01", 
                                                                "2018", labelLoc = "bottom") %>% dyEvent("2020-3-20", "2020", labelLoc = "bottom") %>% 
  dyOptions(drawPoints = TRUE, pointSize = 2)

### Função de Autocorrelação (FAC) e Autocorrelação parcial (FACp) com defasagem 36
# Série em nível - Usarei a rotina do Hyndman e Athanasopoulos (2018).

library(ggplot2)
servico <- servicoma2
servico %>% ggtsdisplay(main = "")

### Série em primeira diferença

#Como a série apresenta variações sazonais importantes, 
#assim como tendência importante, claramente não-estacionárias, 
#vou olhar também em primeira diferença.

servico %>% diff() %>% ggtsdisplay(main = "Série Pesquisa Mensal de Serviços - MA em primeira diferença")

### Primeira diferença sazonal e ACF e PACF
#Farei agora a diferença sazonal.

servico %>% diff(lag = 12) %>% ggtsdisplay(main = "PMS do Maranhão em primeira diferença sazonal")





































































































































































































