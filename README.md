# Mission DataOps : Opération "ShopOps"

Bienvenue dans le dépôt du module **DataOps** pour les étudiants en Master d'informatique de l'EPSI.


### Contexte de la mission

Bienvenue chez **ShopOps**, une plateforme e-commerce française en hyper-croissance opérant à l'international (Europe, US, UK).
Jusqu'à la semaine dernière, notre infrastructure data tenait sur des scripts artisanaux. La catastrophe redoutée a fini par arriver : une mise à jour d'un développeur backend a silencieusement corrompu nos données de ventes. Le CEO a présenté un tableau de bord financier totalement faux aux investisseurs. **La confiance envers la donnée est brisée.**

En tant que nouvelle recrue Data Engineer, vous intégrez la nouvelle "Task Force DataOps". Votre mission : reprendre l'architecture de zéro, instaurer une rigueur logicielle à notre chaîne de traitement de données, et ramener la confiance.

<br>

### Exigence de la direction Financière (CFO)

> <br>
>Équipe Data,
>
> Depuis notre expansion internationale, notre tableau de bord des revenus est incompréhensible. Le montant total additionne des dollars, des livres sterling et des euros sans aucune logique ! En tant qu'entreprise dont le siège est à Paris, j'exige une vision consolidée de notre chiffre d'affaires quotidien dans notre devise de référence.
>
> De plus, notre catalogue tarifaire évolue souvent. J'ai de sérieux doutes sur notre calcul de marge : j'ai l'impression que le système applique les prix actuels du catalogue sur des commandes qui ont été passées il y a 6 mois.
>
> Réglez ça avec l'aide du nouveau Data Engineer, et assurez-vous qu'aucune donnée aberrante ne puisse plus jamais polluer mes rapports.
> <br>



<br>

### Dictionnaire des sources

L'API du site web vous livre 5 flux de données brutes :
1. **`raw_customers`** : Base CRM clients (`id`, `name`, `country`, `signup_date`).
2. **`raw_orders`** : Transactions (`order_id`, `customer_id`, `product_id`, `quantity`, `order_date`, `status`).
3. **`raw_payments`** : Flux financiers (`payment_id`, `order_id`, `amount`, `currency` ,`payment_method`).
4. **`products_scd2`** : Historique du catalogue tarifaire (`product_id`, `price`, `start_date`, `end_date`).
5. **`exchange_rates`** : Taux de change (`date`, `currency_from`, `currency_to`, `rate`). *Attention : Les marchés financiers ferment le week-end.*

<br>

### Les 5 niveaux de la mission

* **Niveau 1 : Les fondations.** Déployer l'infrastructure Cloud isolée et instaurer une hygiène Git stricte.
* **Niveau 2 : Qualité et contrats.** Bâtir une architecture Medallion, nettoyer la donnée et isoler les anomalies sans bloquer le pipeline.
* **Niveau 3 : Consolidation & CI/CD.** Modéliser la table finale du CFO et automatiser la recette technique sur GitHub.
* **Niveau 4 : Orchestration résiliente.** Planifier l'exécution nocturne et gérer les pannes réseau de manière autonome.
* **Niveau 5 : Gouvernance.** Exposer le lignage de la donnée via un catalogue web.

<br>


### Évaluation et critères de succès

Votre infrastructure sera évaluée par le système CI/CD présent dans le projet.

*   **Standardisation et infra** : Exécution propre du pre-commit local et isolation stricte des environnements cloud.
*   **Contrats de données** : Blocage effectif des données aberrantes à l'ingestion.
*   **Versionnement** : Capacité prouvée à restaurer une table corrompue à un instant précis dans le passé.
*   **Observabilité et résilience** : Orchestration fluide et relance automatique fonctionnelle en cas d'erreur.
*   **Déploiement continu** : Validation stricte des tests dans le pipeline CI avant tout déploiement simulé.

<br>
