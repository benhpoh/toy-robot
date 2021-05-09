require_relative "lib/command"

puts "Starting the Toy Robot Simulator"
puts "---"

command = Command.new

while command.simulation_active?
    puts "\nPlease enter one of the following commands:"
    print "PLACE, MOVE, LEFT, RIGHT, REPORT, EXIT: "
    input = STDIN.gets.chomp
    response = command.execute(input)
    
    if !response[:output].nil?
        puts response[:output]
    elsif response[:command_successful] == false
        puts response[:error_message]
    end
end

puts "\nThank you for playing with the Toy Robot Simulator"
puts "---"