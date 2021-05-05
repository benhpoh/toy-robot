require "minitest/autorun"
require "minitest/reporters"
require_relative "../lib/command"

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

class Init_Test < MiniTest::Test
    def test_simulation_active
        command = Command.new
        actual = command.simulation_active?
        expected = true
        assert_equal(expected, actual)
    end
end

class Command_Validation_Test < MiniTest::Test
    # @@ to create a class variable
    @@acceptable_command = true
    @@unacceptable_command = false

    def test_place_command
        command = Command.new
        actual = command.execute("PLACE 0,0,WEST")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_lowercase_place_command
        command = Command.new
        actual = command.execute("place 0,0,west")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_mixedcase_place_command
        command = Command.new
        actual = command.execute("Place 0,0,West")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_move_command
        command = Command.new
        actual = command.execute("MOVE")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_lowercase_left_command
        command = Command.new
        actual = command.execute("left")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_mixedcase_left_command
        command = Command.new
        actual = command.execute("Left")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_uppercase_left_command
        command = Command.new
        actual = command.execute("LEFT")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_right_command
        command = Command.new
        actual = command.execute("right")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end
    
    def test_report_command
        command = Command.new
        actual = command.execute("RePoRt")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_non_place_command_with_arguments
        command = Command.new
        actual = command.execute("REPORT 0,0,WEST")[:command_successful]
        expected = @@unacceptable_command
        assert_equal(expected, actual)
    end

    def test_invalid_pluce_command
        command = Command.new
        actual = command.execute("PLUCE")[:command_successful]
        expected = @@unacceptable_command
        assert_equal(expected, actual)
    end

    def test_invalid_random_command
        command = Command.new
        actual = command.execute("asfg")[:command_successful]
        expected = @@unacceptable_command
        assert_equal(expected, actual)
    end

    def test_invalid_number_command
        command = Command.new
        actual = command.execute(123)[:command_successful]
        expected = @@unacceptable_command
        assert_equal(expected, actual)
    end
end

class Place_Argument_Validation_Test < MiniTest::Test
    # @@ to create a class variable
    @@acceptable_command = true
    @@unacceptable_command = false

    def test_place_without_arguments
        command = Command.new
        actual = command.execute("PLACE")[:command_successful]
        expected = @@unacceptable_command
        assert_equal(expected, actual)
    end

    def test_place_with_good_arguments_1
        command = Command.new
        actual = command.execute("PLACE 4,2,NORTH")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_place_with_good_arguments_2
        command = Command.new
        actual = command.execute("place 1,4,west")[:command_successful]
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end
end