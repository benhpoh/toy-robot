require_relative 'position'

class Robot
    def initialize(table_width, table_height)
        @position = Position.new(table_width, table_height)
    end

    def place(arguments)
        # arguments = "X,Y,DIRECTION"
        *positions, direction = arguments.split(",")

        position_x, position_y = positions.map { |num_string| num_string.to_i }
        direction = direction.to_sym

        @position.x = position_x
        @position.y = position_y
        @position.direction = direction

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