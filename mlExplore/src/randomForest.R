
library(reticulate)
library(dplyr)
library(readr)
library(stringr)

if(F){
  data=read_csv('~/data/exemples/churn.csv')
  data=data %>% mutate(Churn=`Churn?`) %>% select(-`Churn?`)
  data=data %>% mutate("Churn"=str_detect(Churn,"True"))
  write_csv(data, path = '~/data/exemples/churn2.csv')
  data %>% select(Churn) %>% tail(50)
}

# py_run_file('pretraitement_rf.py')
# py_run_file('randomForest.py')
# py$confusion
# py$clfScore

source_python('src_python/pretraitement.py')

# fichier='churn.csv' ; cible='Churn?'
fichier='churn2.csv' ; cible='Churn'

datas=prepare_datas(fichier,cible,
                    dummies=c("Int'l Plan", 'VMail Plan'),
                    to_drop=c('State', 'Area Code', 'Phone'))
exemples=list(
  data=datas[[1]] %>% as_tibble(),
  target=datas[[2]] %>% as_tibble()
)

source_python('src_python/randomForest.py')
res=rf(datas, cible)
res=list(modele=res[[1]], confusion=res[[2]], score=res[[3]], y_test=res[[4]], y_probas=res[[5]], precision=res[[6]], rappel=res[[7]])

if(F){
  res$modele
  res$confusion
  res$score
  res$precision
  res$rappel
}

# ========================================================================================================================================
