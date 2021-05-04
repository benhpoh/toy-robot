class Command
    def initialize
        @simulation_active = true
    end

    def simulation_active?
        @simulation_active
    end

    # Executes methods based on user input
    def execute(input)
        command, argument = input.to_s.upcase.split(" ")

        valid_command?(command) ? "Ok" : "Error"
    end

    private

    # Validates if command provided is acceptable
    def valid_command?(input)
        valid_commands = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]
        valid_commands.include?(input)
    end
end