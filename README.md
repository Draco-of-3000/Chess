# Chess
Welcome to the Chess! This is a command-line implementation of the classic chess game, where players take turns in moving pieces with the aim of capturing the opponent's king piece. This program allows you to enjoy the game while incorporating essential Object-Oriented Programming (OOP) principles. Additionally, you can save your game progress and load it later for continuous enjoyment.

**Features**
- **Visual representation of chessboard:** There is an 8x8 chessboard with properly labeled columns and rows serving as coordinates. The board dynamically updates positions of chesspieces as the game goes on.

- **Unique chesspiece symbols:** Chesspieces are represented by unique unicodes to make the visualization more intuitive.

- **Object-Oriented Programming (OOP):** This program is built using OOP principles, which enhance code organization, reusability, and maintainability. The game logic is divided into appropriate methods and classes, making it easy to understand and extend.

- **Save and Load Game:** Players have the option to save the game and load it later to continue playing from where they left off. When saving, the game state is serialized into a JSON file (chess_save.txt). The serialized data is then loaded back into the game to restore the saved state when the player chooses to load the game. The game state is saved in a structured format using the JSON format, allowing for easy human-readable representation and deserialization.

- **Dynamically assigns chessPieces based on player choice:** Chesspieces are divided based on color and are assigned accordingly based on player choice


**Rules**
- It prevents illegal moves such asmoving to sqaures occupied by the player's own piece, jumping over pieces, and illegal movements

- Ends the game if there are no legal moves to be made

- Ends the game if there is insufficent material to continue

- Ends the game if there is a stalemate

- Ends the game if a player captures the opponent's king piece

- Prevents castling when it is not possible

- Prevents en_pasant_capture when it is not available


**Special Moves**
- It allows the player the capture an opponent's piece en_pasant when possible

- It allows the player to castle when possible

- It allows the player to promote a pawn when possible

**Requirements**
- To run the Chess game, you need to have ruby installed on your machine

**Getting started**
- Clone the repository to your local machine:
  - $ git clone https://github.com/Draco-of-3000/Chess.git

- Navigate to the project directory:
  - $ cd Chess

- Run the game:
  - $ ruby lib/chess.rb
 - The game will start, and you can begin playing by following the on-screen instructions.

**Acknowledgements**
- The Chess game is a classic and well-known game. This implementation is inspired by some FIDE rules and gameplay. This implementation in Ruby is created by Kenshalskis Acheampong.

**Enjoy the game and have fun playing Chess!**
