# 🎵 Music Expert Advisor

Un système expert développé en Prolog pour l'évaluation d'artistes dans l'industrie musicale.

---

## 🚀 Installation Rapide

### 1. Installer SWI-Prolog

**Windows :**
- Téléchargez depuis [swi-prolog.org](https://www.swi-prolog.org/)
- Exécutez l'installateur

**Linux :**
```bash
sudo apt-get install swi-prolog
```

**macOS :**
```bash
brew install swi-prolog
```

### 2. Télécharger les fichiers

```bash
# Clonez le projet
git clone https://github.com/otmsara/MusicExpertAdvisorProlog.git

# Ou téléchargez les 4 fichiers manuellement :
# - base_connaissances.pl
# - moteur_inference.pl  
# - interface.pl
# - main.pl
```

---

## 🖥️ Lancer sur VS Code

### Prérequis
- VS Code installé
- Extension Prolog pour VS Code
- SWI-Prolog installé

### Commande de lancement
```bash
# Dans le terminal VS Code
swipl main.pl
```

---

## 💻 Utilisation

### Lancement du système
```prolog
% Ouvrir SWI-Prolog
% Aller dans le dossier du projet
?- cd('chemin/vers/dossier').

% Lancer le système
?- [main].
```

### Menu principal
```
=================================
   MUSIC EXPERT ADVISOR SYSTEM   
=================================

MENU PRINCIPAL:
1. Évaluer un artiste
2. Lister tous les artistes
3. Trouver artistes recommandables
4. Calculer score
5. Quitter le système
```

### Exemples d'utilisation
1. **Évaluer un artiste :**
   ```
   Choix: 1.
   Nom: amy.
   ```

2. **Lister tous les artistes :**
   ```
   Choix: 2.
   ```

3. **Quitter le système :**
   ```
   Choix: 5.
   ```

---

## 🎤 Artistes disponibles

| Artiste | Genre | Streams | Engagement | 
|---------|-------|---------|------------|
| **amy** | Pop | 2.5M | bon |
| **leo** | Hip-hop | 800k | excellent |
| **sara** | Jazz | 300k | moyen |

---

## ✨ Fonctionnalités

- ✅ Évaluation automatique d'artistes
- ✅ Calcul de score (0-30 points)
- ✅ Recommandations personnalisées
- ✅ Interface interactive en ligne de commande

---

## 📁 Structure du projet

```
music_expert/
├── base_connaissances.pl  # Données des artistes
├── moteur_inference.pl    # Règles et calculs
├── interface.pl           # Menu interactif
└── main.pl               # Point d'entrée
```

---

## 🔧 Développement

Pour modifier ou étendre le système :

1. **Ajouter un artiste** : Modifiez `base_connaissances.pl`
2. **Changer les règles** : Modifiez `moteur_inference.pl`
3. **Modifier l'interface** : Éditez `interface.pl`

---

## 📄 Licence

Projet académique - GINF3 - Ingénierie de la Connaissance

---

## 👤 Auteur

**Sara El-otmani**  
Projet réalisé dans le cadre du module d'Ingénierie de la Connaissance.