require_relative 'robot'

class Command
    
    def initialize(width = "5", height = "5")
        # Parameters allow for customizing table dimension if desired.
        # If no parameters passed in, defaults to 5x5 table

        # STDIN defaults as string. Call to_i to ensure type security
        @table_width = width.to_i
        @table_height = height.to_i

        @robot = Robot.new(@table_width, @table_height)

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

        execution_result = {
            execution_succesful: nil,
            error_message: nil
        }

        case command
        when :PLACE
            # Validate PLACE's argument
            if invalid_argument?(argument)
                @command_response[:command_successful] = false
                @command_response[:error_message] = "The argument '#{argument}' is invalid."

                return @command_response
            end
            execution_result = @robot.place(argument)
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
        
        @command_response[:command_successful] = execution_result[:execution_succesful]
        @command_response[:error_message] = execution_result[:error_message]
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
        return true if position_x.nil? || position_y.nil? || direction.nil?

        # returns true if any of the 3 arguments are invalid
        !(valid_position_x?(position_x) && valid_position_y?(position_y) && valid_direction?(direction))
    end

    # Disallows negative coordinate arguments & off table positioning
    def valid_position_x?(position)
        position >= 0 && position < @table_width
    end

    def valid_position_y?(position)
        position >= 0 && position < @table_height
    end

    def valid_direction?(direction)
        valid_directions = [:NORTH, :SOUTH, :EAST, :WEST]
        valid_directions.include?(direction)
    end
end