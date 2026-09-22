# Pré-requis Techniques & Installation

Ce document détaille les étapes pour préparer votre machine avant de démarrer la mission ShopOps.

 Important : Ne commencez pas le TD tant que le test de validation final (Section 5) ne s'exécute pas parfaitement.

## 1. Préparation du Système d'exploitation

Selon votre machine, la préparation diffère. Identifiez votre OS et suivez les instructions correspondantes.

#### Utilisateurs Windows : Installation de WSL 2 (Obligatoire)

Sur Windows, il est préférable d'utiliser WSL (notamment pour harmoniser le code, et s'assurer de la comptabilité de tous les outils avec votre machine). 

* Ouvrez PowerShell en tant qu'Administrateur
(Clic droit → Exécuter en tant qu'administrateur).

* Lancez l'installation d'Ubuntu via WSL : `wsl --install`

* Redémarrez votre ordinateur

* Au redémarrage, une fenêtre de terminal Ubuntu va s'ouvrir. Créez votre nom d'utilisateur en minuscules, sans espaces.
* Créez ensuite un mot de passe (les caractères ne s'affichent pas quand vous tapez le mot de passe, c'est normal)

Désormais, vous êtes considérés comme des utilisateurs Linux.

Pour la suite de ce guide, vous utiliserez ce terminal Ubuntu et les commandes de la section Linux.

#### Utilisateurs macOS

Votre système est déjà basé sur Unix. L'outil le plus simple pour installer vos dépendances est le gestionnaire de paquets Homebrew.

Ouvrez votre terminal : Application → Utilitaires → Terminal.

Si vous n'avez pas Homebrew, installez-le avec cette commande : 
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

#### Utilisateurs Linux (Debian/Ubuntu)

Ouvrez simplement votre terminal habituel pour passer à la suite.

## 2. Installation du "Toolkit" DataOps

* Si vous êtes sur macOS (via Homebrew)

Exécutez cette commande unique dans votre terminal pour installer l'intégralité des outils :

```
brew update
brew install git python terraform awscli 
```

Passez ensuite directement à l'étape Configuration Globale ci-dessous.

* Si vous êtes sur Linux ou Windows/WSL

Exécutez les blocs de commandes suivants dans votre terminal Ubuntu/Linux.


```
A. Mise à jour et outils de base (Git, Python)
sudo apt update && sudo apt upgrade -y
sudo apt install git python3 python3-pip python3-venv curl unzip -y

B. Terraform CLI (Infrastructure as Code)
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform -y

C. AWS CLI v2 (Interface Cloud)


curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

rm awscliv2.zip && rm -rf aws/
```

## 3. Configuration globale

* Identité Git

Que vous soyez sur Mac ou Linux/WSL, configurez votre identité pour la traçabilité de votre code :


```
git config --global user.name "Votre Prénom Nom"
git config --global user.email "votre.email@ecole.fr"
```

* Récupération des accès AWS

Avant de commencer le code, vous devez configurer les clés AWS que vous pouvez créer via votre IAM User (que je vous fournirai).

Dans votre terminal, tapez : `aws configure`


Remplissez les champs comme suit :


```
Champ	Valeur
AWS Access Key ID	[CLÉ_PUBLIQUE_FOURNIE]
AWS Secret Access Key	[CLÉ_SECRÈTE_FOURNIE]
Default region name	eu-north-1 
Default output format	json
## 4. L'Environnement de Développement (IDE)
```

L'éditeur standard recommandé pour ce cours est Visual Studio Code (VS Code).

Téléchargez et installez VS Code sur votre machine (Windows ou Mac).

* Pour les utilisateurs Windows/WSL : Dans VS Code, installez l'extension WSL de Microsoft.

1. Fermez VS Code.
2. Dans votre terminal Ubuntu, créez votre dossier de travail.
3. Entrez dans ce dossier.
4. Tapez : `code .`


VS Code s'ouvrira en étant directement connecté à l'environnement Linux.

## 5. Test de validation final

Votre machine est-elle prête pour la mission ?

Copiez-collez ce bloc entier dans votre terminal et appuyez sur Entrée :

```
echo "--- VERIFICATION DU TOOLKIT DATAOPS ---"
git --version
python3 --version
terraform --version
aws --version
echo "--- TOUT EST OK ! ---"
```

Résultat attendu : chaque outil doit renvoyer correctement un numéro de version.


### 6. Initialisation de l'environnement virtuel et dbt
Dans votre dossier de projet, créez et activez un environnement virtuel Python, puis installez dbt :
```bash
python3 -m venv venv
source venv/bin/activate  # Sur Mac/Linux/WSL
pip install dbt-core dbt-athena-community
dbt --version
```
Note : Il faudra réactiver cet environnement avec source venv/bin/activate à chaque fois que vous ouvrez un nouveau terminal