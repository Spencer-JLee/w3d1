require_relative 'player.rb'

class Game

    def initialize(player_names)
        @players = Array.new(player_names.length) {Array.new(2, 0)}
        @fragment = ""
        @dictionary = {}
        File.open("./dictionary.txt") do |n|
            n.each do |line|
                key = line.chomp
                @dictionary[key] = nil
            end
        end
    end

    def play_round
        until !take_turn(@current_player)
            next_player!
        end
        puts "#{@current_player.name} has lost."
    end

    def current_player
        @players[0]
    end

    def previous_player
        @players[-1]
    end

    def next_player!
        @players.rotate!
    end

    def take_turn(player)
        str = ""
        puts "The current fragment is #{@fragment}."
        until valid_play?(str)
            puts "Please enter a letter"
            str = gets.chomp
        end
        @fragment += str
        @dictionary.key?(@fragment)
    end

    def valid_play?(str)
        alphabet = ("a".."z").to_a
        if alphabet.include?(str)
            quasi_fragment = @fragment + str
            @dictionary.keys.any? { |k| k[0...quasi_fragment.length] == quasi_fragment }
        else
            false
        end
    end
end