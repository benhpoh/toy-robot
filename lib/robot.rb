require_relative 'position'

class Robot
    attr_reader :is_placed

    def initialize(table_width, table_height)
        @position = Position.new(table_width, table_height)
        @is_placed = false
    end

    def place(arguments)
        # arguments = "X,Y,DIRECTION"
        *positions, direction = arguments.split(",")

        position_x, position_y = positions.map { |num_string| num_string.to_i }
        direction = direction.to_sym

        @position.x = position_x
        @position.y = position_y
        @position.direction = direction

        @is_placed = true 

        {
            execution_succesful: true,
            error_message: nil
        }
    end

    def move
        # Move method
    end

    def left
        directions = [:NORTH, :EAST, :SOUTH, :WEST]
        @position.direction = directions[directions.index(@position.direction) - 1]
        # Unlike javascript, index[-1] loops backwards around the array
        {
            execution_succesful: true,
            error_message: nil
        }
    end

    def right
        directions = [:NORTH, :EAST, :SOUTH, :WEST].reverse!
        @position.direction = directions[directions.index(@position.direction) - 1]
        # Unlike javascript, index[-1] loops backwards around the array
        {
            execution_succesful: true,
            error_message: nil
        }
    end
    
    def report
        {
            execution_succesful: true,
            error_message: nil,
            position_x: @position.x,
            position_y: @position.y,
            direction: @position.direction,
            graphical_map: nil
        }
    end
end