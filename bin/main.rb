#!/usr/bin/env ruby

require "tty-prompt"

def print_dashboard(arr)
  prompt = TTY::Prompt.new

  justify = ' ' * 7
  separation = justify + '-------------'
  prompt.ok(separation)

  i = 0
  while i <= 6
    prompt.ok(justify + "| #{arr[1 + i]} | #{arr[2 + i]} | #{arr[3 + i]} |")
    prompt.ok(separation)
    i = i + 3
  end
end 

def get_players
  prompt = TTY::Prompt.new

  players = Array.new(2)
  # This while block will change, there will be a class Player and instead of strings I will
  #   work with instances of this class.
  while players[0].nil? || players[0] == players[1]
    players[0] = prompt.ask("Alias for player 1?") { |q| q.required true }
    players[1] = prompt.ask("Alias for player 2?") { |q| q.required true }
  end
  players.shuffle!
end

def play_game(players)
  prompt = TTY::Prompt.new

  current_player = 0
  # this will be an object of the class Dashboard
  dashboard = %w[ none 1 2 3 4 5 6 7 8 9 ] 
  # this will change for a while statement and I will validate if there is a place to move
  #   or if someone has won
  9.times do |_num| 
    # this will change becouse of Dashboard class
    print_dashboard(dashboard) 

    # this line will change because of Player class
    place = prompt.ask("#{players[current_player]}, chose a place (1-9)?") do |q|
      q.in '1-9'
      q.messages[:range?] = 'Try again please...'
    end
    
    # this line will execute if the move has been done 
    dashboard[place.to_i] = '✘'
    current_player = current_player == 0 ? 1 : 0 
  end
  current_player = current_player == 0 ? 1 : 0

  display_result(current_player, players, dashboard) 
end

def display_result(current_player, players, dashboard) 
  prompt = prompt = TTY::Prompt.new

  # this will change becouse of Dashboard class
  print_dashboard(dashboard)
  
  # validate if someone wins
  if dashboard
    #this will change because of Player class
    prompt.ok("\n\n#{players[current_player]} wins!!!!!")
  else
    prompt.ok("It is a tie...")
  end
end

prompt = TTY::Prompt.new
prompt.ok('Get start with Tic Tac Toe')
print_dashboard(%w[ none ✘ ✘ ● ✘ ● ✘ ● ✘ ● ])
prompt.keypress("Press enter to continue...", keys: [:return])

players = get_players()

loop do 
    play_game(players)   
    
    break unless prompt.yes?("Do you like to play again?")
end
