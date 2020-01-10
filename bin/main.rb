#!/usr/bin/env ruby

require "tty-prompt"
require_relative "../lib/player"
require_relative "../lib/dashboard"

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
    while players[0].nil? || players[0].alias_player == players[1].alias_player
        players[0] = Player.new(prompt.ask("Alias for player 1?") { |q| q.required true }, '✘')
        players[1] = Player.new(prompt.ask("Alias for player 2?") { |q| q.required true }, '●')
    end
    players.shuffle!
end

def play_game(players)
    prompt = TTY::Prompt.new

    current_player = 0
    dashboard = Dashboard.new #kkkk
    while dashboard.is_there_a_place? && !dashboard.is_there_a_winner? #kkk
        current_player = current_player == 0 ? 1 : 0
        
        print_dashboard(dashboard.arr) #kkk
    
        place = prompt.ask("#{players[current_player].alias_player}, chose a place (1-9)?") do |q|
            q.in '1-9'
            q.messages[:range?] = 'Try again please...'
        end
        dashboard.add_move(place, players[current_player].symbol) #validate this line
    end

    print_dashboard(dashboard.arr)

    if dashboard.is_there_a_winner?
        prompt.ok("\n\n#{players[current_player].alias_player} wins!!!!!") # there is not be always a winner change this
    else
        prompt.ok("It is a tie..")
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










