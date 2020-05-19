
import pandas as pd

def reglage_type(z):
  if(z==''):
    z=[]
  if isinstance(z,str):
    z=[z]
  return z

def prepare_datas(fichier, cible, dummies=[], to_drop=[], pafexemples='exemples/'):
  to_drop=reglage_type(to_drop)
  dummies=reglage_type(dummies)
  features=pd.read_csv(pafexemples+fichier)
  target=features[cible]
  n=len(dummies)
  if(n>0):
    for i in range(0,n):
      di=dummies[i]
      features=features.join(pd.get_dummies(features[di], prefix=di))
      to_drop.append(dummies[i])
  to_drop.append(cible)
  features=features.drop(to_drop,axis=1)
  return (features,target)
