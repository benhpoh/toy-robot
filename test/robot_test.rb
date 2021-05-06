require "minitest/autorun"
require "minitest/reporters"
require_relative "../lib/robot"

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

class Robot_Report_Test < MiniTest::Test
    def test_report_output_1_2_NORTH
        robot = Robot.new(5,5)
        robot.place("1,2,NORTH")
        report = robot.report
        actual = (report[:position_x] == 1 && report[:position_y] == 2 && report[:direction] == :NORTH)
        expected = true
        assert_equal(expected, actual)
    end

    def test_report_output_4_3_WEST
        robot = Robot.new(5,5)
        robot.place("4,3,WEST")
        report = robot.report
        actual = (report[:position_x] == 4 && report[:position_y] == 3 && report[:direction] == :WEST)
        expected = true
        assert_equal(expected, actual)
    end
end