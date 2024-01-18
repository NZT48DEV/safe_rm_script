#!/bin/bash

# Définit le chemin du dossier corbeille et la durée de conservation des fichiers
CORBEILLE=~/CORBEILLE_RM
AGE_MAX=30

# Créer le dossier corbeille si nécessaire
mkdir -p "$CORBEILLE"  # mkdir -p crée le dossier s'il n'existe pas déjà

# Fonction pour déplacer les fichiers/dossiers à la corbeille
safe_rm() {
    for path in "$@"; do  # Parcourt tous les arguments passés à la fonction
        base=$(basename "$path")  # Extrait le nom de base du fichier/dossier
        dest="$CORBEILLE/$base"  # Définit le chemin de destination dans la corbeille
        i=1  # Initialise un compteur pour les doublons de noms
        while [ -e "$dest" ]; do  # Boucle tant qu'un fichier/dossier du même nom existe
            dest="$CORBEILLE/$base($i)"  # Ajoute un indice au nom pour éviter les doublons
            i=$((i + 1))  # Incrémente l'indice
        done
        mv "$path" "$dest"  # Déplace le fichier/dossier dans la corbeille
    done
}

# Fonction pour nettoyer la corbeille
clean_corbeille() {
    find "$CORBEILLE" -type f -mtime +$AGE_MAX -delete  # Supprime les fichiers plus vieux que AGE_MAX
    find "$CORBEILLE" -type d -empty -delete  # Supprime les dossiers vides
}

# Remplacer la commande rm
if [ "$1" = "--clean" ]; then  # Si le premier argument est --clean
    clean_corbeille  # Appelle la fonction de nettoyage
else
    safe_rm "$@"  # Sinon, appelle la fonction safe_rm avec tous les arguments passés au script
fi