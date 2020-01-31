# Tic-Tac-Toe Game

> Let's play [Tic Tac Toe](https://www.wikihow.com/Play-Tic-Tac-Toe)

<p align="center">
    <img src="screenshots/meme-tic-tac-toe.jpg">
</p>

The main goal of this project was to build a Tic Tac Toe game getting practice the Object Oriented 
Programing (OOP) paradigm. It consist of an interface ([main.rb](bin/main.rb)) and two classes ([dashboard.rb](lib/dashboard.rb) and [player.rb](lib/player.rb)). For the interface I used [TTY prompt component](https://github.com/piotrmurach/tty-prompt#31-symbols) to get a interactive command line prompt.

## Built With

- Ruby
- [TTY prompt component](https://github.com/piotrmurach/tty-prompt)

## How to install the game?

### Prerequisites
- Ruby [installed](https://www.ruby-lang.org/en/downloads/)
- Bundler [installed](https://bundler.io/)

### Install
- Get a local copy of the [game](https://github.com/fivan18/tic-tac-toe)
- Inside the root directory of the game run `bundle install` on the command line

## Instructions to play the game
1. Inside the root directory of the game run `bin/main.rb`
  ```
    $ bin/main.rb 
    Get start with Tic Tac Toe
       -------------
       | ✘ | ✘ | ● |
       -------------
       | ✘ | ● | ✘ |
       -------------
       | ● | ✘ | ● |
       -------------
    Press enter to continue... 
  ```
2. Enter the players aliases (the game will chose a randomly player to start the game)
  ```
    Alias for player 1? Ivan
    Alias for player 2? Lalo 
  ```
3. Each player choose different places to do their move until someone wins or there will not be more places in the dashboard
  ```
       -------------
       | 1 | 2 | 3 |
       -------------
       | 4 | 5 | 6 |
       -------------
       | 7 | 8 | 9 |
       -------------
    Lalo, chose a place (1-9)? ● 1
       -------------
       | ● | 2 | 3 |
       -------------
       | 4 | 5 | 6 |
       -------------
       | 7 | 8 | 9 |
       -------------
    Ivan, chose a place (1-9)? ✘ 7
       -------------
       | ● | 2 | 3 |
       -------------
       | 4 | 5 | 6 |
       -------------
       | ✘ | 8 | 9 |
       -------------
    Lalo, chose a place (1-9)? ● 2
       -------------
       | ● | ● | 3 |
       -------------
       | 4 | 5 | 6 |
       -------------
       | ✘ | 8 | 9 |
       -------------
    Ivan, chose a place (1-9)? ✘ 8
       -------------
       | ● | ● | 3 |
       -------------
       | 4 | 5 | 6 |
       -------------
       | ✘ | ✘ | 9 |
       -------------
    Lalo, chose a place (1-9)? ● 3
       -------------
       | ● | ● | ● |
       -------------
       | 4 | 5 | 6 |
       -------------
       | ✘ | ✘ | 9 |
       -------------


    Lalo wins!!!!!
  ```

4. Press (y/n) keys to play again or get out of the game
  ```
    Do you like to play again? no
    $
  ```

## Authors

👤 **Ivan Ulises Guzman Sanchez**

- Github: [@fivan18](https://github.com/fivan18)
- Twitter: [@fivanunam](https://twitter.com/fivanunam)
- Linkedin: [fivan](https://www.linkedin.com/in/fivan)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/fivan18/tic-tac-toe/issues).

## 📝 License

This project is [MIT](README.md) licensed.
