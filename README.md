# Base de données de gestion de réservation pour un hôtel

Ce dépôt contient les exercies de création de base de données ainsi que de requêtage portant sur la base de données de getion de réservation, utilisé en formation AFPA.

Vous y retrouverez :
- La création de base de données
- La création d'un jeu de test
- Du requêtages

Compétences abordées :
- analyse et mise à jour de base de données
- mise en place d'une base de données en utilisant Docker
...

## Déploiement de la base de données Docker

Le fichier "docker-compose.yml" va permettre d'instancier un conteneur Postgres accessible via le réseau local :

![Représentation de l'accès au conteneur Postgres à partir de locahost](postgres-container.svg)

Pour instancier le container, exécuter la commande suivante :
```bash
docker compose -d
```
Veillez à faire attention au **conflits de ports** (notamment avec les services pré-installés en local) et modifiez la redirection de port en fonction.

## Acccès à la BDD

Utilisateur super admin (attention !) : **postgres**
Mot de passe : **supersecured**

Vous pouvez également vous connecter en utilisant un client de BDD tel que :
- [DBeaver](https://dbeaver.io/) -> pour l'installation avec [winget](https://winget.run/pkg/dbeaver/dbeaver)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)