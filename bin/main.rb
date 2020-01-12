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

def play_game(current_player, players_name, dashboard)
  prompt = TTY::Prompt.new

  3.times do |_num|              #this will for a while
    current_player = current_player == players_name[0] ? players_name[1] : players_name[0]
    
    print_dashboard(dashboard)

    place = prompt.ask("#{current_player}, chose a place (1-9)?") do |q|
      q.in '1-9'
      q.messages[:range?] = 'Try again please...'
    end
    dashboard[place.to_i] = '✘'
  end

  prompt.ok("\n\n#{current_player} wins!!!!!")
end

prompt = TTY::Prompt.new
prompt.ok('Get start with Tic Tac Toe')
print_dashboard(%w[ none ✘ ✘ ● ✘ ● ✘ ● ✘ ● ])
prompt.keypress("Press enter to continue...", keys: [:return])

players_name = get_players_name()

loop do 
  current_player = players_name[0]
  dashboard = %w[ none 1 2 3 4 5 6 7 8 9 ]
  play_game(current_player, players_name, dashboard)   
  
  break unless prompt.yes?("Do you like to play again?")
end










