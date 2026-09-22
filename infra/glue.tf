# ==============================================================================
# TODO Niveau 1 : Créer les bases de données logiques dans AWS Glue Catalog
# ==============================================================================
# Aide : Cherchez la documentation de la ressource "aws_glue_catalog_database"
# Attention : Leurs noms doivent se terminer par _${var.student_id} pour éviter les conflits !

# Base de données pour la couche Staging (Vues de nettoyage)
resource "aws_glue_catalog_database" "staging" {
  name = "shopops_staging_${var.student_id}"

}

# Base de données pour la couche Intermediate (Jointures et logique métier)
resource "aws_glue_catalog_database" "intermediate" {
  # TODO : Nommer la base "shopops_intermediate_VOTRE_ID"
  name = "shopops_intermediate_${var.student_id}"

}

# Base de données pour la couche Marts (Tables physiques finales Iceberg)
resource "aws_glue_catalog_database" "marts" {
  # TODO : Nommer la base "shopops_marts_VOTRE_ID"
  name = "shopops_marts_${var.student_id}"

}
