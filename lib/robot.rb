require_relative 'position'

class Robot
    attr_reader :is_placed

    @@succesful_execution = {
        execution_succesful: true,
        error_message: nil
    }

    def initialize(table_width, table_height)
        @position = Position.new(table_width, table_height)
        
        @min_position_x = 0
        @max_position_x = table_width - 1
        # table width of 5 => max_position_x = 4
        
        @min_position_y = 0
        @max_position_y = table_height - 1
        # table height of 5 => max_position_y = 4

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

        @@succesful_execution
    end

    def move
        move_accepted = true

        case @position.direction
        when :EAST
            @position.x < @max_position_x ? @position.x += 1 : move_accepted = false
        when :WEST
            @position.x > @min_position_x ? @position.x -= 1 : move_accepted = false
        when :NORTH
            @position.y < @max_position_y ? @position.y += 1 : move_accepted = false
        when :SOUTH
            @position.y > @min_position_y ? @position.y -= 1 : move_accepted = false
        end

        if move_accepted
            @@succesful_execution
        else
            {
                execution_succesful: false,
                error_message: "Moving will result in Robot falling off the table"
            }
        end
    end

    def left
        directions = [:NORTH, :EAST, :SOUTH, :WEST]
        @position.direction = directions[directions.index(@position.direction) - 1]
        # Unlike javascript, index[-1] loops backwards around the array
        @@succesful_execution
    end

    def right
        directions = [:NORTH, :EAST, :SOUTH, :WEST].reverse!
        @position.direction = directions[directions.index(@position.direction) - 1]
        # Unlike javascript, index[-1] loops backwards around the array
        @@succesful_execution
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