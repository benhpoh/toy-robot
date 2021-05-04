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
    @@acceptable_command = "Ok"
    @@unacceptable_command = "Error"

    def test_place_command
        command = Command.new
        actual = command.execute("PLACE")
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_lowercase_place_command
        command = Command.new
        actual = command.execute("place")
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_mixedcase_place_command
        command = Command.new
        actual = command.execute("Place")
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_move_command
        command = Command.new
        actual = command.execute("MOVE")
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_lowercase_left_command
        command = Command.new
        actual = command.execute("left")
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_mixedcase_left_command
        command = Command.new
        actual = command.execute("Left")
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_uppercase_left_command
        command = Command.new
        actual = command.execute("LEFT")
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end

    def test_right_command
        command = Command.new
        actual = command.execute("right")
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end
    
    def test_report_command
        command = Command.new
        actual = command.execute("RePoRt")
        expected = @@acceptable_command
        assert_equal(expected, actual)
    end


    def test_invalid_pluce_command
        command = Command.new
        actual = command.execute("PLUCE")
        expected = @@unacceptable_command
        assert_equal(expected, actual)
    end

    def test_invalid_random_command
        command = Command.new
        actual = command.execute("asfg")
        expected = @@unacceptable_command
        assert_equal(expected, actual)
    end

    def test_invalid_number_command
        command = Command.new
        actual = command.execute(123)
        expected = @@unacceptable_command
        assert_equal(expected, actual)
    end
end