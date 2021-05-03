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