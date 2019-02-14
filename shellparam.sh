#!/bin/bash

echo "Début du script"

list=$(ls -a)			# Variable pour parcourir les fichiers existants
dos=0 					# Variable d'existence du dossier
nom=$1					# Nom du dossier créé
fichierlog=$2	# Nom du fichier créé

# Création du fichier
echo "Nom du dossier : "$nom
echo "Nom du fichier : "$fichierlog
echo "Initialisation des logs" >> $HOME/$fichierlog.txt

# Création du répertoire

for fichier in $list # Parcourir les fichiers existants
do
	if [ $HOME/$fichier = $HOME/$nom ] # Cas où le dossier existe
		then 
			echo "Le dossier $nom existe déjà et va être utilisé."
			dos=1
	fi
done

if [ $dos = 0 ] # Cas où le dossier n'existe pas
	then
		mkdir $HOME/$nom
		echo "Le dossier $nom a été créé."
fi

mv $HOME/$fichierlog.txt $HOME/$nom

for fichier in $list # Parcourir les fichiers existants
do
	if [ $HOME/$nom/$fichier.txt = $HOME/$nom/$fichierlog.txt ] # Cas où le dossier existe
		then 
			echo "Le fichier $fichierlog existe."
			dos=2
	fi
done

if [ $dos = 2 ] # Cas où le dossier n'existe pas
	then
		echo "Le fichier n'existe pas."
		echo "EXTERMINATE ! EXTERMINATE ! BLBLBLBL"
        exit 1
fi

cd $HOME
rm -rf $nom
echo "Fin du script"