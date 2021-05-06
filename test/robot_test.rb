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

    def test_report_output_3_4_SOUTH
        robot = Robot.new(5,5)
        robot.place("3,4,SOUTH")
        report = robot.report
        actual = (report[:position_x] == 3 && report[:position_y] == 4 && report[:direction] == :SOUTH)
        expected = true
        assert_equal(expected, actual)
    end

    def test_report_output_4_3_EAST
        robot = Robot.new(5,5)
        robot.place("4,3,EAST")
        report = robot.report
        actual = (report[:position_x] == 4 && report[:position_y] == 3 && report[:direction] == :EAST)
        expected = true
        assert_equal(expected, actual)
    end

    def test_report_output_2_1_WEST
        robot = Robot.new(5,5)
        robot.place("2,1,WEST")
        report = robot.report
        actual = (report[:position_x] == 2 && report[:position_y] == 1 && report[:direction] == :WEST)
        expected = true
        assert_equal(expected, actual)
    end
end

class Robot_Left_Test < MiniTest::Test
    def test_left_from_NORTH
        robot = Robot.new(5,5)
        robot.place("0,0,NORTH")
        robot.left

        report = robot.report
        actual = report[:direction]
        expected = :WEST
        assert_equal(expected, actual)
    end

    def test_left_from_WEST
        robot = Robot.new(5,5)
        robot.place("0,0,WEST")
        robot.left

        report = robot.report
        actual = report[:direction]
        expected = :SOUTH
        assert_equal(expected, actual)
    end

    def test_left_from_SOUTH
        robot = Robot.new(5,5)
        robot.place("0,0,SOUTH")
        robot.left

        report = robot.report
        actual = report[:direction]
        expected = :EAST
        assert_equal(expected, actual)
    end

    def test_left_from_EAST
        robot = Robot.new(5,5)
        robot.place("0,0,EAST")
        robot.left

        report = robot.report
        actual = report[:direction]
        expected = :NORTH
        assert_equal(expected, actual)
    end
end

class Robot_Right_Test < MiniTest::Test
    def test_right_from_NORTH
        robot = Robot.new(5,5)
        robot.place("4,4,NORTH")
        robot.right

        report = robot.report
        actual = report[:direction]
        expected = :EAST
        assert_equal(expected, actual)
    end

    def test_right_from_WEST
        robot = Robot.new(5,5)
        robot.place("4,4,WEST")
        robot.right

        report = robot.report
        actual = report[:direction]
        expected = :NORTH
        assert_equal(expected, actual)
    end

    def test_right_from_SOUTH
        robot = Robot.new(5,5)
        robot.place("4,4,SOUTH")
        robot.right

        report = robot.report
        actual = report[:direction]
        expected = :WEST
        assert_equal(expected, actual)
    end

    def test_right_from_EAST
        robot = Robot.new(5,5)
        robot.place("4,4,EAST")
        robot.right

        report = robot.report
        actual = report[:direction]
        expected = :SOUTH
        assert_equal(expected, actual)
    end
end