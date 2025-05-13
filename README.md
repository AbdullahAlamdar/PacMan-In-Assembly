# 🕹️ Assembly Pac-Man Style Game

This is a Pac-Man inspired arcade game written entirely in **x86 Assembly Language** using the **Irvine32** library. It runs in a text-based console environment and features player movement, ghost enemies, fruit collection, walls, scoring, file handling, and lives system.

---

## 📦 Features

### 🎮 Player Movement
- Controlled using arrow keys.
- The player character is represented by a specific ASCII character.
- Position is tracked using `xPos` and `yPos` variables.

### 👻 Ghost Enemies
- Ghosts include: `ghost`, `inky`, and `clyde`.
- Each ghost has independent X and Y coordinates (e.g., `Xghost`, `Yghost`).
- Movement logic is based on random directions and simple AI patterns.
- Ghost collision reduces lives.

### 🧱 Walls and Collision
- Multiple wall layers exist:
  - `XBlocksStarting`, `XBlocksStarting1`, `XBlocksStarting2`
  - `YBlocksStarting`, etc.
- Prevents player or ghosts from moving through walls.
- Collision detection is done by comparing coordinates.

### 🍒 Fruits and Coins
- Coins are distributed on the map using looped drawing and coordinates.
- Fruits appear at randomized intervals and positions.
- When a fruit is collected, the score increases.

### ❤️ Lives System
- Player starts with 3 lives: displayed as `$`, `$$`, `$$$`.
- Stored in `lives`, `lives1`, `lives2`, `lives3` variables.
- On ghost collision, a life is lost.
- Game ends when all lives are lost.

### 🧾 Score Display
- Current score is stored in the `score` variable.
- Displayed on screen via the `strScore` string.

### 📝 File Handling
- Uses Windows API (via Irvine32) for saving and loading scores.
- Paths:
  - `Scores.txt`
  - `Scores1.txt`
- File read/write buffers:
  - `buffer`, `fileHandle`, `bytesRead`.

### 🧑 Name Input
- User can enter their name at the start.
- Stored in the `names` array and displayed on screen.

### ⏱️ Timer
- Tracks how long the game has been running.
- Timer variables: `starttimer`, `endTimer`, `timer`.

---

## 🔧 How the Grid is Made

- The grid is made by printing characters such as `_`, `|`, and `-` using strings like:
  - `ground`, `ground1`, `ground2`, `ground3`
- Walls are drawn by iterating over predefined X and Y coordinate arrays.
- Additional coordinate arrays such as `Xcoordinates`, `Ycoordinates`, `Xwalls`, `Ywalls` store dynamic positions.

---

## 🚶 How the Player Moves

- Movement keys (up/down/left/right) are detected through keyboard interrupt logic.
- Movement updates `xPos` and `yPos`.
- The game checks for collision with walls and stops movement accordingly.
- The screen is refreshed/redrawn after each move to reflect updated positions.

---

## 📂 Directory Structure
- COAL_FINAL_PROJECT/
- │
- ├── ABC.asm # Main game code (Assembly)
- ├── Scores.txt # Score storage file
- ├── Scores1.txt # Secondary score storage
- └── README.md # Documentation (this file)



---

## 🧠 Main Variables Summary

| Variable          | Purpose                                           |
|------------------|---------------------------------------------------|
| `xPos`, `yPos`    | Player coordinates                                |
| `Xghost`, etc.    | Ghost coordinates                                 |
| `score`           | Tracks player's score                             |
| `lives`           | Lives left                                        |
| `XBlocks...`      | Wall and boundary coordinates                     |
| `Xcoordinates`    | Used to track all drawn X positions               |
| `Xfruit`, `Yfruit`| Fruit spawn coordinates                           |
| `buffer`          | Used for reading/writing file content             |
| `names`           | Stores player name                                |
| `strScore`        | Message to print the score                        |
| `fileHandle`      | Stores file pointer                               |
| `inputChar`       | Stores key pressed by the user                    |
| `paused`          | Stores pause state                                |
| `fruits`          | Array of fruit timers or states                   |

---

## 🏁 How to Play

1. Run the program in an emulator that supports Irvine32 (e.g., DOSBox or Win32 console).
2. Enter your name when prompted.
3. Use arrow keys to move around the map.
4. Collect fruits and avoid ghosts.
5. Your score increases with fruit and coin collection.
6. Game ends when all lives are lost.



---

## ✨ Credits

- Built using Irvine32 library.
- Developed as a final project for **Computer Organization and Assembly Language (COAL)** course.
- Contributors: *[Abdullah Alamdar]*

---

## 📷 Screenshots

###  Game Start Screen
![Start Screen ASSCI Art](images/screenshot1.png)

###  Game Menu
![Menu](images/screenshot2.png)

### Level Selection
![Level Selection](images/screenshot3.png)

### Game Layout And Play
![Game Layout](images/screenshot4.png)

---

## 📜 License

This project is for academic purposes only and is not intended for commercial use.



