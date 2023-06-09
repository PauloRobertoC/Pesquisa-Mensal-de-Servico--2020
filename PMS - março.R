### analise da PMS - pesquisa mensal de comercio (marco, 2020)
### modelagem Arima
### autor: Paulo Roberto Carneiro de S�

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

### plot basico lembrar que em class(), ele j� indicou que era ts = serie
# temporal
plot(servicoma2)

# pelo pacote dygraph d� mais op��es
library(dygraphs)
help("dygraph")

dygraph(servicoma2, main = "Pesquisa mensal de servi�os - IBGE") %>% 
  dyAxis("x", drawGrid = TRUE) %>% dyEvent("2011-1-01", "2011", labelLoc = "bottom") %>% 
  dyEvent("2015-1-01", "2015", labelLoc = "bottom") %>% dyEvent("2018-1-01", 
                                                                "2018", labelLoc = "bottom") %>% dyEvent("2020-3-20", "2020", labelLoc = "bottom") %>% 
  dyOptions(drawPoints = TRUE, pointSize = 2)

### Fun��o de Autocorrela��o (FAC) e Autocorrela��o parcial (FACp) com defasagem 36
# S�rie em n�vel - Usarei a rotina do Hyndman e Athanasopoulos (2018).

library(ggplot2)
servico <- servicoma2
servico %>% ggtsdisplay(main = "")

### S�rie em primeira diferen�a

#Como a s�rie apresenta varia��es sazonais importantes, 
#assim como tend�ncia importante, claramente n�o-estacion�rias, 
#vou olhar tamb�m em primeira diferen�a.

servico %>% diff() %>% ggtsdisplay(main = "S�rie Pesquisa Mensal de Servi�os - MA em primeira diferen�a")

### Primeira diferen�a sazonal e ACF e PACF
#Farei agora a diferen�a sazonal.

servico %>% diff(lag = 12) %>% ggtsdisplay(main = "PMS do Maranh�o em primeira diferen�a sazonal")





































































































































































































