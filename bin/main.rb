#!/usr/bin/env ruby

require "tty-prompt"

def print_dashboard(arr)
    prompt = TTY::Prompt.new
    justify = ' ' * 7
    separation = justify + '-------------'
    prompt.ok(separation)
    arr.each do |item|
        prompt.ok(justify + "| #{item[0]} | #{item[1]} | #{item[2]} |")
        prompt.ok(separation)
    end
end 

prompt = TTY::Prompt.new
prompt.ok('Get start with Tic Tac Toe')
print_dashboard([['✘', '✘', '●'], ['✘', '●', '✘'], ['●', '✘', '●']])

player_1 = prompt.ask("What is the name of player 1?") do |q|
    q.required true
    q.validate /\A\w+\Z/
    q.modify   :capitalize
end
player_2 = prompt.ask("What is the name of player 2?") do |q|
    q.required true
    q.validate /\A\w+\Z/
    q.modify   :capitalize
end

# chose the name aleatory who's will go first

# while current player not win
    # switch player
    # display dashboar
    # ask the player to chose a place in the dashboard
# end

# display the winner






