# Setup
## Installation
Ce projet utilise [fvm](https://fvm.app/).

fvm permet de gérer les versions de flutter par projects et est supporté dans [l'extension vscode](https://fvm.app/docs/getting_started/configuration/#vs-code), [android studio](https://fvm.app/docs/getting_started/configuration/#android-studio) et [neovim](https://github.com/akinsho/flutter-tools.nvim).

```
# switch sur la version du projet utilisée
fvm flavor dev
# installer les paquets
fvm flutter pub get
```

## Lancer le project
Utiliser l'extension de votre IDE ou manuellement : 

- Lister les devices avec `fvm flutter devices`

- Démarrer le project sur avec `fvm flutter run -d <device_name>`

# Widget exploré

Le Widget exploré est [sqflite](https://pub.dev/packages/sqflite)

# Guide utilisateur
Une fois le projet lancé, nous avons une page dans laquelle on peut remplir 2 champs (title et content) puis appuyer sur le bouton `Add TODO`.

Une fois cette tâche ajoutée, elle sera affichée en dessous des champs.

Il est aussi possible de supprimer la tâche en cliquant sur l'icône avec la poubelle.
