setwd("C:~")
dir()
#install.packages("marmap")
library(marmap)
library(ggplot2)
install.packages("patchwork")
library(patchwork)
install.packages("mapproj")
library(mapproj)
library(maps)


erizocap<-read.csv('Capt_geo_2019.csv',sep=";")
names(erizocap)
#LATITUD  LONGITUD CAPTURA_1

#saco los datos geo malo (= a cero)

erizocap<-erizocap[erizocap$LATITUD<0,]

bathy <- getNOAA.bathy(-77,-72,-47,-41, resolution=1, keep=TRUE)
map <-autoplot(bathy, geom=c("r", "c"), show.legend=FALSE) + 
  scale_fill_etopo() + labs(x = "Longitude", y = "Latitude")
map + geom_point(data=erizocap, aes(x=LONGITUD, y=LATITUD, size=CAPTURA_1, alpha=0.05))
# 
# 
# bathy <- getNOAA.bathy(-77,-72,-47,-41, resolution=1, keep=TRUE)
# map2 <-autoplot(bathy, geom=c("r", "c"), show.legend=FALSE) + 
#   scale_fill_etopo() + labs(x = "Longitude", y = "Latitude")+
#   geom_point(data=erizocap, aes(x=LONGITUD, y=LATITUD, size=CAPTURA_2, alpha=0.05))
# 
# (map|map2)/(map|map)
