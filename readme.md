# La Piscine

La Piscine est un **lieu de partage de nos réalisations** en **R** ou en **python**.

Comme son nom l'indique, il s'agit d'être le plus naturel possible dans ses travaux.
Que vous soyez débutant ou expert, soyez fier de vos travaux. **Ici venez comme vous êtes.** 

Chaque semaine, une donnée est proposée pour exercer nos compétences en traitement
des données : acquisition, stockage, croisement, visualisation, graphique, carte,
iontelligence artificielle.

Ce dépôt permet à chacun de publier ses réalisations.

## Le parcours aquatique

* Jeudi 2 avril : [COVID_19](20200402-COVID19/readme.md) / deux contributions sont à découvrir : carte et diagrammes en barre

* Samedi 12 avril : [NRJ179](20200412-NRJ179/readme.md)

* Jeudi 16 avril :

* Jeudi 25 avril : 
 
## Les bons comportement au bord de la piscine

Toutes les nageuses et nageurs, tous niveaux et toutes nages confondus, s'engagent à :

* ne pas plonger : ie ne pas traiter trop en avance les données proposées. Les informations
vous sont communiquées afin que vous puissiez y réfléchir un peu avant... pas plus !

* ne pas pousser un nageur dans l'eau : ie ne pas critiquer (*inutilement*) les contributions proposées.
En revanche, toute explication pouvant aider à mieux nager est la bienvenue.
Le principe de la bienveillance est la règle.

## Matériel : les bouées et autres accessoires

Pour avoir de l'aide, demandez sur le salon **spyrales** de Tchap !

## La douche obligatoire (mode opératoire pour publier)

Vous pouvez partager vos scripts (python ou R), vos notebooks ou documents R Markdown.

Pour celles et ceux qui sont à l'aise, vous pouvez faire une _pull request_ dans 
[spyrales/la-piscine](https://github.com/spyrales/la-piscine/).
Pour les autres, vous pouvez les poster dans le salon **spyrales** de Tchap ou les envoyer par mail.

## Le vestiaire 

Vous pouvez partager ce que vous avez laissé en cours de route et pourquoi (temps, difficulté...).

Pour publier ses réalisations, il convient de réaliser les actions suivantes.

* avoir un compte GitHub

Aller sur le site [GitHub](https://github.com) et cliquer sur `sign up`.
Suivre les instructions. Cela prend une à deux minutes maximum.

* forker le projet *la piscine*

Aller sur la page de [*la piscine*](https://github.com/spyrales/la-piscine/),
cliquer sur le bouton `fork` en haut à droite de l'interface de GitHub et choisir votre compte GitHub.
Vous avez maintenant une copie du projet *la piscine* dans votre espace.
C'est sur ce projet que vous devez d'abord copier votre réalisation.

* copier en local votre *fork*

Deux commandes suffisent (la première pour copier, la seconde pour ajouter la référence au projet) : 
```
git clone https://github.com/<votre compte>/la-piscine.git
git remote add upstream https://github.com/spyrales/la-piscine.git
```

* créer une *branche*

Choisir un nom pour votre branche, idéalement un terme pour s'y retrouver simplement.
Evitons les espaces et autres caractères spéciaux.

```
git checkout -b nom_de_ma_branche
```

* copier une réalisation dans le répertoire correspondant

Exemple : réalisation d'une carte avec les données du COVID_19.
Les programmes en R ou en Python, ainsi que le résultat, sont à copier dans un 
répertoire par personne, comme `str-carte` (str pour vos initiales et carte pour le nom
de votre carte)
(évitons de nouveau les caractes spéciaux).

```
cp -a -r monrepertoire/macarte/* 20200402-COVID19/str-carte
git add 20200402-COVID19/str-carte
git commit -m 'ajout carte COVID - str'
git push --set-upstream origin nom_de_ma_branche
```

(saisir ses crendentials GitHub si demandé)

* faire une *pull request*

Revenir sur la page de *la piscine*. L'interface doit afficher automatiquement 
votre branche `identifiant:nom_de_ma_branche` pour faire une *pull request*.
Cliquer sur le bouton *compare & pull request*. Vérifier qu'il n'y a pas 
d'incompatibilité (il est alors affiché *able to merge*), modifier si besoin 
le titre de votre *pull request* et cliquer enfin sur *create pull request*.

Voilà votre réalisation a été proposée pour publication et 
un gestionnaire de *la piscine* la validera très vite.

* supprimer sa branche

Une fois validée par un gestionnaire, votre réalisation est intégrée dans *la piscine*.
Votre branche *nom_de_ma_branche* n'est plus utile. Vous pouvez la supprimer via l'interface de GitHub, 
sur la page de votre *fork*, en cliquant sur *branch*, ensuite sur la ligne correspondante
(nom_de_ma_branche), cliquer sur l'icone *poubelle*.

Voilà c'est (maintenant) terminé. Bravo !
