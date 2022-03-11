# devops

## Git Actions
Git actions permet de build et de push notre image docker sur docker hub à chaque fois que du codes est poussé sur la branch main la config se trouve ici :
[code](https://github.com/HETIC-localize/API/blob/main/.github/workflows/build-push-docker.yaml)

## Terraform
[Doc gcp terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
On utilise terraform pour la création des instances sur gcp (google cloud platform)

#### Config
Pour pouvoir utiliser terraform il d'abord créer un projet [Documentation](https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=fr&visit_id=637825593608297430-4214153680&rd=1#identifying_projects) 

Ensuite créer un compte de service sur gcp puis générer une nouvelle clé.
[Documentation](https://support.google.com/a/answer/7378726?hl=fr)

Modifier les valeurs dans le variables.tf à la racine par les nouvelles

#### Use
Commande pour lancer terraform :

``` 
terraform init 
```

``` 
terraform apply 
```

## Ansible
[Doc ansible](https://docs.ansible.com/ansible/latest/index.html)
Ansible permet ici à la création d'une nouvelle instance par l'autoscaler d'installer l'image docker de notre api et de faire la config

### Env
Ce dossier sers à gérer les configurations pour les différents types d'environnements (prod, staging, dev) 

### Ansible vault
Ansible vault permet de crypter des fichiers

Commande pour crypter le fichier qu’on veut :

```
ansible-vault encrypt path_du_fichier_a_crypter
```

Commande pour decrypt le fichier qu’on veut :

```
ansible-vault decrypt path_du_fichier_a_crypter
```

Commande pour voir le fichier crypter :

```
ansible-vault view path_du_fichier_a_crypter
```

Commande pour editer le fichier crypter :

```
ansible-vault edit path_du_fichier_a_crypter
```

### Roles
#### Back_end
* Role qui permet de set le docker-compose et de la lancer
#### geerlingguy.docker
* Role communautaire qui permet d'installer docker sur le serveur [github](https://github.com/geerlingguy/ansible-role-docker)
#### geerlingguy.pip
* Role communautaire qui permet d'installer pip sur le serveur [github](https://github.com/geerlingguy/ansible-role-pip)

#### Use
La commande est lancé automatiquement avec le template d'instance de gcp.

Commande pour lancer le playbook :

``` 
ansible-playbook -i env/hosts/prod playbook.yml 
```