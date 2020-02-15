#!/usr/bin/env ruby
# frozen_string_literal: true

require 'tty-prompt'
require_relative '../lib/player'
require_relative '../lib/dashboard'

def print_dashboard(arr)
  prompt = TTY::Prompt.new

  justify = ' ' * 7
  separation = justify + '-------------'
  prompt.ok(separation)

  i = 0
  while i <= 6
    prompt.ok(justify + "| #{arr[1 + i]} | #{arr[2 + i]} | #{arr[3 + i]} |")
    prompt.ok(separation)
    i += 3
  end
end

def arr_players
  prompt = TTY::Prompt.new

  players = Array.new(2)
  while players[0].nil? || players[0].alias_player == players[1].alias_player
    players[0] = Player.new(prompt.ask('Alias for player 1?') { |q| q.required true }, '✘')
    players[1] = Player.new(prompt.ask('Alias for player 2?') { |q| q.required true }, '●')
  end
  players.shuffle!
end

def play_game(players)
  prompt = TTY::Prompt.new

  current_player = 0
  dashboard = Dashboard.new
  while dashboard.there_a_place? && !dashboard.there_a_winner?
    system('clear')
    print_dashboard(dashboard.arr)

    place = prompt.ask(
      "#{players[current_player].alias_player}," \
      " chose a place (1-9)? #{players[current_player].symbol}"
    ) do |q|
      q.validate dashboard.places_available
      q.messages[:valid?] = 'Invalid, enter again...'
    end

    current_player = current_player.zero? ? 1 : 0 if
      dashboard.add_move(place, players[current_player].symbol)
  end
  current_player = current_player.zero? ? 1 : 0

  system('clear')
  display_result(current_player, players, dashboard)
end

def display_result(current_player, players, dashboard)
  prompt = TTY::Prompt.new

  print_dashboard(dashboard.arr)

  if dashboard.there_a_winner?
    prompt.ok("\n\n#{players[current_player].alias_player} wins!!!!!")
  else
    prompt.ok('It is a tie...')
  end
end

system('clear')

prompt = TTY::Prompt.new
prompt.ok('Get start with Tic Tac Toe')
print_dashboard(%w[none ✘ ✘ ● ✘ ● ✘ ● ✘ ●])
prompt.keypress('Press enter to continue...', keys: [:return])

players = arr_players


system('clear')
loop do
  play_game(players)

  break unless prompt.yes?('Do you like to play again?')
end
