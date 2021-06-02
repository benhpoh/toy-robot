require "minitest/autorun"
require "minitest/reporters"
require_relative "../lib/command"

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

class Acceptance_Test < MiniTest::Test
    def test_example_a
        command = Command.new
        command.execute("PLACE 0,0,NORTH")
        command.execute("MOVE")
        report = command.execute("REPORT")
        actual = report[:output]
        expected = "X: 0, Y: 1, DIRECTION: NORTH"
        assert_equal(expected, actual)
    end

    def test_example_b
        command = Command.new
        command.execute("PLACE 0,0,NORTH")
        command.execute("LEFT")
        report = command.execute("REPORT")
        actual = report[:output]
        expected = "X: 0, Y: 0, DIRECTION: WEST"
        assert_equal(expected, actual)
    end

    def test_example_c
        command = Command.new
        command.execute("PLACE 1,2,EAST")
        command.execute("MOVE")
        command.execute("MOVE")
        command.execute("LEFT")
        command.execute("MOVE")
        report = command.execute("REPORT")
        actual = report[:output]
        expected = "X: 3, Y: 3, DIRECTION: NORTH"
        assert_equal(expected, actual)
    end

    def test_place_object
        command = Command.new
        command.execute("PLACE 0,0,EAST")
        command.execute("PLACE_OBJECT")
        response = command.execute("MOVE")
        actual = response[:command_successful]
        expected = false
        assert_equal(expected, actual)
    end
end