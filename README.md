# safe_rm_script

## Français

### À propos
`safe_rm_script_fr.sh` est un script conçu pour remplacer la commande `rm` traditionnelle. Il vise à prévenir la suppression accidentelle de fichiers en les déplaçant dans un dossier nommé `~/CORBEILLE_RM`. Les fichiers dans ce dossier sont automatiquement supprimés après 30 jours. Si un fichier avec le même nom existe déjà dans la corbeille, un indice est ajouté au nom pour éviter les conflits.

### Configuration
Pour utiliser ce script :
1. Placez `safe_rm_script_fr.sh` dans un répertoire de votre choix.
2. Rendez le script exécutable avec `chmod +x safe_rm_script_fr.sh`.
3. Ajoutez un alias dans votre fichier `.bashrc` ou `.zshrc` : `alias rm="/chemin/vers/safe_rm_script_fr.sh"`.
4. Rechargez votre fichier de configuration `source ~/.bashrc` ou redémarrez votre terminal.

_____________________________________________________________________________________________________

## English

### About
`safe_rm_script_en.sh` is a script designed to replace the traditional `rm` command. It aims to prevent accidental file deletion by moving files to a `~/TRASH_RM` folder. Files in this folder are automatically deleted after 30 days. If a file with the same name already exists in the trash, an index is added to the name to avoid conflicts.

### Setup
To use this script:
1. Place `safe_rm_script_en.sh` in a directory of your choice.
2. Make the script executable with `chmod +x safe_rm_script_en.sh`.
3. Add an alias in your `.bashrc` or `.zshrc` file: `alias rm="/path/to/safe_rm_script_en.sh"`.
4. Reload your configuration file `source ~/.bashrc` or restart your terminal.
