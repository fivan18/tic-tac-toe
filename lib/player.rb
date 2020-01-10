class Player
    attr_reader :alias_player, :symbol

    def initialize(alias_player, symbol)
        @alias_player = alias_player
        @symbol = symbol
    end
end