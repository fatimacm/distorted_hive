# 🐝 Distorted Hive – Flutter Microgame of Uncertainty

**Distorted Hive** is a minimal, turn-based microgame built with Flutter.  
The player interacts with a hidden set of predefined values, presented as icons across a limited grid.  
Outcomes vary depending on chance, sequencing, and resource management.

---

## 🎯 Objective

You start with **7 points**.  
Your goal is to explore the full grid while preserving your score.  
Each icon reveals a different effect. No pattern is guaranteed.

| Icon           | Description                 | Points Effect   |
|----------------|-----------------------------|-----------------|
| 🐞 Bug          | Local corruption             | −2 points       |
| 🌿 Nature       | Environmental resistance     | −1 point        |
| ❤️ Heart        | Stabilizing input            | +2 points       |
| ⭐ Star         | Internal modifier            | +1 point        |

---

## 🔁 End States

- **0 points** → Game over  
- **15 points** → Game completed  
- **All cells flipped without reaching either** → Undefined outcome

---

## 🧠 Core Mechanics

- 5x5 grid (25 unique cells)  
- Each cell can be revealed only once  
- Icons are assigned at random at the start of each game  
- State is local and ephemeral  
- No external input or persistent memory

---

## 🛠️ Tech Stack

- **Flutter** (cross-platform UI toolkit)  
- **Dart** (language)  
- Components: `StatefulWidget`, `GridView`, local state, custom transitions  

---

## 🚀 How to Run Locally

1. Make sure you have [Flutter SDK](https://flutter.dev/docs/get-started/install) installed  
2. Clone this repository:

   ```bash
   git clone git@github.com:fatimacm/distorted_hive.git
   cd distorted_hive
   flutter pub get
   flutter run
   
Supports:

- Chrome (Web)

- Windows (Desktop)

- Android Emulator / Physical Device

## 📌 Notes
Distorted Hive is not deterministic. It does not rely on skill, pattern recognition, or strategy.
It models uncertainty under constraint. All behavior is observable but not predictable. 
No decisions are reversible. But every session resets the field.

## 🧾 Author
Developed by Fátima Coronado Interface design, behavior modeling, and local state transitions.
