# My Own MVC

## Présentation
Ce framework PHP vous permet de réaliser rapidement et efficacement vos sites.
Sa force réside dans sa simplicité et la rapidité d'apprentissage qui en
découle.

Via cet exemple voulu très générique vous pourrez tester la sécurité de son
système d'authentification et de contrôle d'assession aux différentes pages basé
sur système de rang utilisateur très facilement extensible.

Découvrez toutes ces autres caractéristiques au travers du code et n'hesitez pas
à l'étendre.

Pour l'essayer :

    En administrateur :
        log : admin@test.dev
        mdp : admin
    
    En utilisateur lambda :
        log : regular@test.dev
        mdp : regular

-----------------

## Prérequis au fonctionnement
* Si vous souhaitez essayer ce framework en local, afin de répondre aux 
attentes du routeur, le dossier contenant le site devra être placé dans
un **virtualhost** afin de simuler un nom de domaine à votre site.
* Une fois le nom de domaine choisis vous devrez le renseigner dans le
fichier de configuration à la racine du projet dans la contante
"**DOMAIN_NAME**" où est par défaut affecté "dev.myownmvc".
* Dans ce même fichier renseignez les informations d'accès à votre base de
donnée.
* Dans votre base de donnée, importez la structure et les données contenues
dans le fichier à la racine du projet "myownmvc.sql", le framework
travail avec cette structure minimum en base; elle permet la gestion des
accès et le contrôle des autorisations.
