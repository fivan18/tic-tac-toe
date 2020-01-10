class Dashboard
    LINES_TO_WIN = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    attr_reader :arr

    def initialize
        @arr = %w[ none 1 2 3 4 5 6 7 8 9 ]
    end

    def is_there_a_place?
        self.arr.each do |item|
            return true if item != 'none' && item != '✘' && item != '●'
        end
        false
    end
end