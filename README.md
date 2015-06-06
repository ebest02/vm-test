# Bonzaï Digital recruitement test

  > Machine virtuelle pour le test de recrutement 

## DEPOTS

* APPLICATION ZEND 1

  > https://github.com/ebest02/test.git
  

* MACHINE VIRTUELLE

  > https://github.com/ebest02/vm-test.git
  
## INSTALLATION ET USAGE
```
git clone https://github.com/ebest02/vm-test.git
cd vm-test
vagrant up
vagrant ssh
```

Allez sur la page http://localhost:8080, vous devriez me voir et découvrir ma liste de course


## EXPLICATIONS
  > Le fichier Vagrantfile permet de créer la VM. Il récupère le dépot git de l'application ZEND. 
  > En fin d'installation le script install.sh est exécuté :  il se charge de créer la base MySQL, le VHOST NGINX et configure PHP (fichiers dans data) 

