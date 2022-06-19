# Description 
Déploiement d'une application dans une fonction lambda 

## Objectif 
Déploiement de code présent dans un bucket s3 dans une fonction lambda sur AWS en créant un module terraform 

## Boîte à outils 
1. Visual Studio Code
2. Compte AWS + AWS Cli
3. Key SSH
4. Ne pas oublier le .gitignore pour les données personnelles

# Déploiement d'un bucket 
AWS S3 static website bucket

This module provisions AWS S3 buckets configured for static website hosting.

## Usage

```hcl
module "<module name>" {
    source = "path of your module"
    bucket_name = "<UNIQ BUCKET NAME>"
    tags = {
        key   = "<value>"
    }
}
```
## Démarrage module

Se mettre à la racine du projet
```
terraform init
terraform plan
terraform apply
```
## Notes 
Tu es devenu(e) un jeune padawan du module Terraform !!
