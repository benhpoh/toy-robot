class Command
    
    def initialize
        @simulation_active = true

        @command_response = {
            command_successful: nil,
            error_message: nil
        }
    end

    def simulation_active?
        @simulation_active
    end

    # Executes methods based on user input
    def execute(input)
        reset_command_response()
        
        command, argument = input.to_s.upcase.split(" ")
        command = command.to_sym

        
        case command
        when :PLACE
            # Validate PLACE's argument
            if invalid_argument?(argument)
                @command_response[:command_successful] = false
                @command_response[:error_message] = "The argument '#{argument}' is invalid."

                return @command_response
            end
            # call robot.place(X,Y,FACE)
        when :MOVE
            # call robot.move
        when :LEFT
            # call robot.left
        when :RIGHT
            # call robot.right
        when :REPORT
            # call robot.report
        else
            @command_response[:command_successful] = false
            @command_response[:error_message] = "Invalid command entered."
    
            return @command_response
        end
        
        @command_response[:command_successful] = true
        @command_response
    end

    private

    # Resets response prior to parsing new command input
    def reset_command_response
        @command_response[:command_successful] = nil
        @command_response[:error_message] = nil
    end
    
    # Checks if arguments provided are invalid
    def invalid_argument?(arguments)
        return true if arguments.nil?

        # arguments = "X,Y,DIRECTION"
        *positions, direction = arguments.split(",")

        position_x, position_y = positions.map { |num_string| num_string.to_i }
        direction = direction.to_sym

        # returns true if any of the 3 arguments are invalid
        !(valid_position?(position_x) && valid_position?(position_y) && valid_direction?(direction))
    end

    # Disallows negative coordinate arguments
    def valid_position?(position)
        position >= 0
    end

    def valid_direction?(direction)
        valid_directions = [:NORTH, :SOUTH, :EAST, :WEST]
        valid_directions.include?(direction)
    end
end