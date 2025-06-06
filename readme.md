# Mastermind Game

This is a command-line implementation of the Mastermind game in Ruby. The game allows for a single human player to play against the computer, or for the AI to make guesses based on a generated code.

## Requirements

- Ruby installed on your machine
- The `colorize` gem

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/kandelakitina/Mastermind
   ```
2. Navigate to the project directory:
   ```sh
   cd mastermind-game
   ```
3. Install the necessary gems:
   ```sh
   bundle install
   ```
                                                                                                      
## How to Play

1. Start the game by running the main file:
   ```sh
   ruby main.rb
   ```
2. If you're a human player, follow the prompts to either create a code or guess the code based on the game mode.
3. If playing against AI, the computer will make guesses automatically.

## Rules

- The player needs to guess the correct sequence of colors.
- There are six possible colors: red, green, yellow, blue, magenta, and cyan.
- After each guess, feedback is provided in the form of pegs:
  - Black peg: Correct color in the correct position.
  - White peg: Correct color in the wrong position.
  - No peg: Incorrect color.
- The game allows a maximum of 10 attempts to guess the correct sequence.

## License

This project is open-source and available under the MIT License.
