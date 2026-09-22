# Consignes Techniques

Ce document vous guide pas-à-pas dans l'implémentation technique de votre pipeline. Il est votre feuille de route pour valider les 5 niveaux de la mission.


## Niveau 1 : Le socle infrastructure
L'équipe sécurité exige une séparation étanche des environnements de chaque développeur sur AWS.

1. **Initialiser Terraform :** Dans votre dépôt, créez les fichiers `.tf` nécessaires. Configurez le `provider` AWS pour cibler la région `eu-north-1`.
2. **Isolation des ressources :** Déclarez une variable `student_id`. Utilisez-la pour suffixer vos ressources afin de créer un bucket S3 unique et une base de données logique AWS Glue qui vous sont propres.
3. **Hygiène du code :** Mettez en place des `pre-commit hooks` en local. Configurez-les pour bloquer tout commit si la commande `terraform fmt` échoue.

---

## Niveau 2 : Modélisation et qualité
Il faut nettoyer et certifier la donnée pour le CFO.

1. **Initialisation dbt :** Initialisez votre projet `dbt_shopops` et configurez votre `profiles.yml` pour communiquer avec Athena au format Iceberg.
2. **Architecture Medallion :**
   * **Staging :** Créez vos vues SQL de base (renommage, typage).
   * **Intermediate :** Créez les vues gérant la logique métier (jointure des devises, vérification des prix historiques SCD2).
   * **Marts :** Matérialisez les tables finales (dont `fct_orders`).
3. **Gestion des anomalies :** Dans vos fichiers `.yml`, définissez vos tests de qualité (`not_null`, `unique`, règles métiers via `dbt_expectations`). Activez le paramètre `store_failures: true` pour isoler les mauvaises lignes en quarantaine (base d'audit) sans faire crasher la transformation.

---

## Niveau 3 : Intégration continue
La recette technique doit être automatisée par un robot sur les serveurs de GitHub.

1. **Création du Workflow :** Rédigez le fichier YAML dans `.github/workflows/`.
2. **Sécurité :** Sur votre dépôt GitHub, insérez vos identifiants AWS dans les **Secrets**. Utilisez l'action `aws-actions/configure-aws-credentials` pour les injecter de manière sécurisée dans la pipeline.
3. **Exécution :** Le workflow doit se déclencher au `push` sur `main`, installer Python/dbt, et tester la connexion (`dbt debug`).

---

## Niveau 4 : Orchestration et résilience
Les API partenaires plantent souvent vers 2h du matin. Votre pipeline doit encaisser ces micro-coupures.

1. **Planification :** Ajoutez un déclencheur temporel (`schedule` > `cron`) à votre CI/CD.
2. **Stratégie de Retry :** Pour l'exécution de dbt, utilisez une action communautaire (ex: `nick-invision/retry@v9`). Configurez un maximum de 3 tentatives espacées de 60 secondes.
3. **Atomicité :** Utilisez la commande `dbt build` pour exécuter la transformation et les tests en une seule étape sécurisée.

---

## Niveau 5 : Gouvernance, lignage 
La direction veut pouvoir consulter le lignage des données et interdit la modification directe en production.

1. **Documentation Métier :** Documentez au minimum vos modèles finaux (`marts`) directement dans vos fichiers `.yml` (`description`, `columns`).
2. **Site Web dbt :** Modifiez votre workflow pour exécuter `dbt docs generate --empty-catalog`. Utilisez ensuite une action (ex: `peaceiris/actions-gh-pages@v3`) pour déployer le dossier `target/` sur la branche `gh-pages`.
3. **Activation :** Sur GitHub, activez GitHub Pages sur la racine de la branche `gh-pages`. Vérifiez que votre catalogue est accessible en ligne.
