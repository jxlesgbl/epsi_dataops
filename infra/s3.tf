# ==============================================================================
# TODO Niveau 1 : Créer les buckets S3 pour stocker la donnée et les requêtes
# ==============================================================================
# Aide : Cherchez la documentation de la ressource "aws_s3_bucket" sur Terraform

# 1. Bucket pour les résultats de requêtes d'Athena
# Nom attendu : epsi-shopops-dev-athena-results-${var.student_id}
resource "aws_s3_bucket" "athena_results" {
  # TODO : Déclarez le bucket ici en utilisant la variable student_id
  
}

# 2. Bucket pour stocker les fichiers de données (Iceberg/Parquet) générés par dbt
# Nom attendu : epsi-shopops-dev-dbt-data-${var.student_id}
resource "aws_s3_bucket" "dbt_data" {
  # TODO : Déclarez le bucket ici en utilisant la variable student_id
  
}