# 🐝 Distorted Hive – Strategic Flutter Game

**Distorted Hive** is a simple, interactive microgame developed in Flutter. Each cell on the board hides an icon that affects your score.  
Flip cells, manage your points, and try to control the hive.


---

## 🎯 Game Objective

You start with **7 points**.

Each cell hides an icon that will affect your score once flipped:

| Icon           | Meaning                    | Points Effect   |
|----------------|----------------------------|-----------------|
| 🐞 Bug (`bug_report`)   | Hive infection               | −2 points       |
| 🌿 Nature (`emoji_nature`) | Environmental interference    | −1 point        |
| ❤️ Heart (`favorite`)   | Care and regeneration        | +2 points       |
| ⭐ Star (`star`)         | Inner boost                  | +1 point        |

The game ends when:

- Your points reach **0** → _The hive consumed you._
- Your points reach **15** → _You ruled the hive._

---

## 🧠 Game Mechanics

- 5x5 grid board (25 cells total)  
- Each cell can be flipped **only once**  
- Icons are randomly assigned at the start of each game  
- The "Restart" button resets the board, icons, and points  
- If you flip all cells without reaching 0 or 15 points, you get a **Silent Victory**

---

## ✨ Technologies Used

- **Flutter** (cross-platform SDK)  
- **Dart** as the main programming language  
- Utilizes `StatefulWidget`, `GridView`, animations, and state management  

---

## 🚀 How to Run Locally

1. Make sure you have [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.  
2. Clone this repository:

``` bash
git clone git@github.com:fatimacm/distorted_hive.git
cd distorted_hive
```
3. Install dependencies:
``` bash
flutter pub get
```

4. Run the project:

``` bash
flutter run
```

You can run on:

- Chrome (Web)

- Windows (Desktop)

- Android Emulator / Physical Device


# 📚 Additional Notes

This project was designed as a test of visual logic, interaction, and state control with Flutter.

No internet connection or external dependencies required.

Expandable with sounds, timer, new icons, and enemy/ally logic.

# 👑 Author
Developed by Fátima Coronado.
