class Game

    def initialize(player_number)
        @players = Array.new(player_number)
        @fragment = ""
        @dictionary = {}
    end

    def play_round

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