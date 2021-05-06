class Position
    attr_reader :table_width, :table_height
    attr_accessor :x, :y, :direction

    def initialize(table_width, table_height)
        @table_width = table_width
        @table_height = table_height

        @x = nil
        @y = nil
        @direction = nil
    end

end