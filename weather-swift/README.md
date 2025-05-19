# 🌤️ weather-swift

Une application météo iOS stylée et intuitive, développée en **SwiftUI**, qui affiche les prévisions météo quotidiennes et hebdomadaires pour n’importe quelle ville française. Elle inclut la géolocalisation automatique et un système de favoris avec des icônes ultra kawaii.

---

## ✨ Fonctionnalités

- 🔍 Recherche de ville avec autocomplétion
- 📍 Météo basée sur la géolocalisation actuelle
- 📅 Prévisions sur 7 jours (affichage horizontal)
- ⭐ Système de favoris avec étoile kawaii custom
- 🎨 UI personnalisée (icônes, couleurs, fond dégradé rose)
- 💾 Stockage local avec `SwiftData`
- 🧱 Architecture MVVM propre et scalable

---

## 📸 Aperçu de l'app

| Accueil | Recherche | Prévisions 7 jours |
|--------|-----------|--------------------|
| ![Accueil](assets/preview_home.png) | ![Recherche](assets/preview_search.png) | ![Semaine](assets/preview_weekly.png) |

---

## 🧠 Structure du projet

```
weather-swift/
├── API.swift                  # Gestion des appels à l'API météo
├── City.swift                 # Modèle de ville
├── DailyView.swift            # Vue principale du jour
├── FavoritesView.swift        # Liste des favoris
├── Forecast.swift             # Modèle des prévisions
├── ForecastDayView.swift      # Carte prévision par jour
├── FormatDate.swift           # Outils de formatage de date
├── HomeView.swift             # Écran d'accueil principal
├── LocationManager.swift      # Gestion de la position
├── MainTabView.swift          # Navigation par onglets
├── SearchView.swift           # Recherche de villes
├── SideMenu.swift             # Menu latéral personnalisable
├── TimeView.swift             # Heure dynamique affichée
├── Weathers.swift             # Enum de météo + assets associés
└── WeeklyView.swift           # Affichage horizontal des prévisions
```

---

## ⚙️ Installation

### 1. Clone le projet

```bash
git clone https://github.com/ton-user/weather-swift.git
```

### 2. Ouvre le projet dans Xcode

```bash
open weather-swift/weather-swift.xcodeproj
```

### 3. Lance sur simulateur ou appareil réel

✅ Compatible iOS 16+

---

## 🔐 Clé API

L’app utilise l’API de [Meteo-Concept](https://api.meteo-concept.com/).  
La clé est définie dans `API.swift` :

```swift
private let Key = "TA_CLE_API_ICI"
```

Remplace-la par ta propre clé si besoin.

---

## 📦 Dépendances

Aucune dépendance externe.  
Tout est en **Swift pur**, basé sur :

- `SwiftUI`
- `SwiftData`
- `CoreLocation`

---

## 🧠 Architecture

Le projet suit une architecture **MVVM modulaire**, séparant bien :

- Modèles (`Forecast`, `City`)
- Vues (`DailyView`, `WeeklyView`)
- ViewModels (`SearchViexModel`)
- Services (`API.swift`, `LocationManager.swift`)

---

## 🧑‍🎓 Réalisé par

**Tiffany Dbeissy**  
**Tom Fleurent**
**Clément Moreau**
**Noah Barreau**
**Mathis Chartouni**

📍 SDV Bordeaux  
🎓 Projet de formation iOS – Mai 2025

> "Arrête de pleuvoir." ☔💖

---

## 📄 Licence

Ce projet est sous licence [MIT](LICENSE).

---

## ⭐️ Bonus visuel

![Kawaii Weather](assets/kawaii_banner.png)
