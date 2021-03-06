Objectif naïf du projet mlExplore
---------------------------------

Permettre aux utilisateurs de sélectionner des modèles de **M**achine
**L**earning compatibles avec leurs données.

Bien souvent, de nombreuses implémentations existent, sous R et sous
Python pour ne s’en tenir qu’à ces deux langages.

Le but est de s’y retrouver tout en s’affranchissant de la barrière …de
la langue !

Pour le modèle sélectionné, le choix d’une implémentation est proposé
(si possible) :

-   avec scikit-learn, donc en Python

-   ou bien avec R + packages spécialisés

De quoi s’agit-il vraiment ?
----------------------------

### =&gt; Un outil pédagogique

Tout l’intérêt du projet ne se résume pas au produit final et
certainement pas à ses capacités de calcul :

Des outils graphiques pour gérer des problèmes ML, il en existe déjà
beaucoup

-   GCP
-   MatLab (The MathWorks)

**On pourra continuer la liste non exhaustive**

L’outil produit ici ne peut concurrencer sur le fond les acteurs
spécilistes du domaine depuis des années.

Il apporte plutôt une dimension pédagogique en présentant aux
*utilisateurs*

-   des algorithmes,
-   des modèles,
-   un concentré d’éléments de connaissances relatives au ML, adapté *à
    eux* puisque enrichi *par eux*.

Mais l’intérêt pédagogique ne se résume pas au produit fini.

Au contraire, l’élaboration elle-même du projet constitut l’essentiel de
la démarche engagée ici.

Les apports pour notre connaissance et savoir-faire sont multiples :

Il s’agit d’un exercice grandeur nature, collaboratif, qui met en oeuvre
les outils récents de développement,

et les 2 langages qui ont réuni la communauté Spyrales.

Le projet n’a donc pas vocation a être terminé un jour, ce serait
tellement dommage (!)

### =&gt; Un produit Spyrales

Quoi de plus enthousiasmant qu’un premier outil totalement maîtrisé par
la communauté Spyrales puisque développé par elle et pour ses propres
objectifs.

Où en sommes-nous ?
-------------------

Au tout début…

Mais voyons d’un peu plus près sous 2 angles différents

### Du point de vue de l’utilisateur, que trouve-t-on dans ce projet ?

Une interface permettant de choisir nos propres fichiers pour les
soumettre au ML

Un premier modèle est proposé : **Random Forest**, avec une
implémentation **Python/scikit-learn**

et une autre avec **R** associé au costaud **ranger**

### Du point de vue du développeur, qu’avons-nous appris/mis en oeuvre ?

Langages de programmation

-   R
-   python

Environnement de dev

-   Rstudio
-   ShinyApp

Bibliothèques

-   scikitlearn
-   panda

Que faire de plus ?
-------------------

**La liste va être longue…**

On peut commencer par…

### Corriger les bugs

-   Tous les fichiers utilisateurs .csv ne sont pas bien pris en compte
-   ?

### Ajouter des modèles

-   Bien les décrire
-   Proposer au moins une implémentation (nous sommes à peu près sûr de
    la trouver dans scikit-learn)
-   Soigner l’affichage de la sortie (exemple de la courbe de gain
    cumulée pour *random forest*)

Conseils pour le bon démarrage de l’application
-----------------------------------------------

Pré-requis :

1.  Pour ceux qui traverse des proxies, on m’a soufflé qu’une ligne
    telle que  
    **Sys.setenv(http\_proxy = “xxxx”)**  
    peut aider dans global.R
2.  Un certain nombre de librairies sont bien sûr nécessaires

Pour les scripts python d’une part :

-   pandas
-   scikit-learn\`

Mais tant qu’on y est, on peut installer aussi d’autres librairies qui
seront utiles rapidement.

Dans une console R, j’ai fait comme ceci :

    library(reticulate)

    conda_install("r-reticulate", "scipy")
    conda_install("r-reticulate", "scikit-learn")
    conda_install("r-reticulate", "pandas")
    conda_install("r-reticulate", "matplotlib")
    conda_install("r-reticulate", "scikit-plot")
    conda_install("r-reticulate", "seaborn")

Pour les scripts R d’autres part :

-   reticulate (pour articuler R et Python)
-   DT (pour afficher efficacement les tableaux de données)
-   dplyr (pour les manipuler)
-   readr (pour lire les fichiers csv, mais là je ne suis pas de très
    bon conseil)
-   stringr (je l’utilise pour remettre dans le rang les noms de
    colonnes contenant des charactères exotiques)
-   tictoc (pour mesurer les temps d’exécution, elle est tip top !)
-   shinyEffects (pour faire joli)
-   shinydashboard (parce que c’est beau)

-   ranger : le petit dernier pour faire du randomForest efficace sous
    R, alternativement à scikitlearn qui s’avèrera là-dessus moins bon.
    A confirmer.

Les commandes à passer, toujours sous R :

    install.packages('reticulate')
    install.packages('tictoc')
    install.packages('shinyEffects')
    install.packages('shinydashboard')
    install.packages('DT')
    install.packages('dplyr')
    install.packages('readr')
    install.packages('ranger')

Après avoir récupéré tout le paquet (avec l’outil git à priori), je vois
2 options :

1.  le déposer dans le dossier ShinyApps s’il existe et qu’un serveur
    Shiny tourne sur votre machine locale.

2.  le déposer où bon vous semble pour le reconnaître ensuite dans vos
    projets à partir de l’environnement Rstudio.

C’est presque tout :

Option 1 : accédez classiquement depuis le navigateur à la page
@ip/users/votreUser/mlExplore/

Option 2 : sous Rstudio, se positionner sur global.R, ui.R ou server.R
puis runApp

Personnellement, je n’ai pas pris le temps d’installer (sur mon pc
nouvellement acquis) un server Shiny. Vous me direz si vous rencontrez
des problèmes en choisissant l’option 1, mais à priori il n’y aura pas
de soucis.

Je suis dans le cas de l’option 2

-   pour mon pc perso, tout fonctionne parfaitement.

-   et puis aussi sur une machine bien plus puissante …qui n’est pas à
    moi et à laquelle j’accède par ssh.

Il se trouve que l’affichage du DISPLAY sur la machine distante est un
peu rebel. Pour franchir l’obstacle, je n’ai rien trouvé de mieux que de
lancer le petit script python **plot.py** que vous trouverez dans
src\_python/ . Cela m’active l’affichage et tout fonctionne alors à
merveilles. C’est de la bidouille, conseillez moi vite un truc plus pro
si vous savez et avez du temps à consacrer à ça !

Et à quoi ça ressemble en images ?
----------------------------------

Vous demander de commencer par corriger les bugs, c’est pas très vendeur
je reconnaît.

Plus vendeur, une image :

![Sortie d’un modèle célèbre](mlExplore.png)
