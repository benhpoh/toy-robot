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

        if invalid_command?(command)
            @command_response[:command_successful] = false
            @command_response[:error_message] = "Invalid command entered."

            return @command_response
        end

        if command == :PLACE
            status = valid_argument?(argument) ? "Ok" : "Error"
            # TODO. Full steps of receiving a PLACE command
        elsif !argument.nil?
            @command_response[:command_successful] = false
            @command_response[:error_message] = "The command '#{command}' does not accept arguments."

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

    # Checks if command provided is invalid
    def invalid_command?(input)
        valid_commands = [:PLACE, :MOVE, :LEFT, :RIGHT, :REPORT]
        !valid_commands.include?(input)
    end
    
    # Checks if arguments provided is acceptable
    def valid_argument?(arguments)
        return false if arguments.nil?

        # arguments = "X,Y,DIRECTION"
        *positions, direction = arguments.split(",")

        position_x, position_y = positions.map { |num_string| num_string.to_i }
        direction = direction.to_sym

        if valid_position?(position_x) && valid_position?(position_y) && valid_direction?(direction)
            true
        else
            false
        end
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