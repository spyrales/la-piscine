# Spyrales - La Piscine
# #1 - 02/04/2020
#
# Utilisation de données Covid19
#
# Frédéric GALLOIS
#
# Langage  : R
# Objectif : faire une carte (jamais fait de carte en R)
# 
# Supports :
# - ThinkR https://thinkr.fr/sil-te-plait-dessine-moi-carte-r/
# - Claire Della Vdeova https://statistique-et-logiciel-r.com/premiers-pas-en-cartographie-avec-r/
#
# Choix des fonds de cartes : http://leaflet-extras.github.io/leaflet-providers/preview/
#
# Fichier shapefile (contour des pays européens) : https://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/administrative-units-statistical-units/countries
# Il a ici été téléchargé et placé dans le répertoire shape (countries 2016, échelle 1:10million)
#
#---------------------------------
# Difficultés :
# - paramétrage du proxy pour récupérer les données

#=================================================

#------------------------
# Librairies
#------------------------

# Cartes avec OpenStreetMap
library(leaflet)

# Lecture du fichier de données
library(tidyverse)

# chargement du ficier shapefile
library(sf)

#------------------------
# Traitement
#------------------------

# Paramétrage du proxy
Sys.setenv(http_proxy = "http://proxy-rie.http.insee.fr:8080")
Sys.setenv(https_proxy = "http://proxy-rie.http.insee.fr:8080")

# Liste des pays européens
listeUE <- read_csv2 ("ue/ListeUE.csv")

#---------- Données Covid ---------------------------
# Recuperation des donnees Covid
dataCovid <- read_csv ("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")

# Affichage de l'entete pour avoir un aperçu des donnée
head(dataCovid)

# Filtrage des données
# - sur les colonnes : Country/Region, Lat, Long, 4/1/20 (1er avril)
# - renommage des colonnes : Pays, Lat, Long, NbCas
# - sur les données : sur les pays d'Europe
dataCovid <- dataCovid %>%
  select('Country/Region', 'Lat', 'Long', '4/1/20') %>%
  rename('Pays' = 'Country/Region', 'NbCas' = '4/1/20') %>%
  filter(Pays %in% listeUE$Country)


#---------- Données carte ---------------------------
# Lecture du shapefile pour tous les pays
Monde <- st_read(here::here("shape","CNTR_RG_10M_2016_4326.shp"), quiet=TRUE)

# Filtrage des contours (shapefile) pour l'union européenne
Europe <- Monde %>%
            filter(NAME_ENGL %in% listeUE$Country)

  
# Affichage de la carte
# - restriction de la zone pour couvrir l'Europe
# - ajout d'un fonds de carte
# - mise en évidence des pays souhaités
# - affichage des données Covid sur la carte
leaflet() %>% 
  fitBounds(-20,65,20,40) %>%
  addProviderTiles(providers$OpenStreetMap.France) %>%
  addPolygons(data=Europe,weight = 2, color="yellow",fillOpacity=0.35) %>%
  addLabelOnlyMarkers(data = dataCovid,
                      label = as.character(dataCovid$NbCas),
                      labelOptions = labelOptions(noHide = T,
                                                  direction = 'center',
                                                  textOnly = T,
                                                  textsize = '12px'))
