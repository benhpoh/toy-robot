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

class Robot_Move_Test < MiniTest::Test
    def test_move_east_within_boundary
        robot = Robot.new(5,5)
        robot.place("0,0,EAST")
        move_response = robot.move

        actual = robot.report[:position_x] == 1 && robot.report[:position_y] == 0 && move_response[:execution_succesful]
        expected = true
        assert_equal(expected, actual)
    end

    def test_move_east_off_boundary
        robot = Robot.new(5,5)
        robot.place("4,0,EAST")
        move_response = robot.move

        actual = robot.report[:position_x] == 4 && robot.report[:position_y] == 0 && move_response[:execution_succesful] == false
        expected = true
        assert_equal(expected, actual)
    end

    def test_move_west_within_boundary
        robot = Robot.new(5,5)
        robot.place("4,0,WEST")
        move_response = robot.move

        actual = robot.report[:position_x] == 3 && robot.report[:position_y] == 0 && move_response[:execution_succesful]
        expected = true
        assert_equal(expected, actual)
    end

    def test_move_west_off_boundary
        robot = Robot.new(5,5)
        robot.place("0,0,WEST")
        move_response = robot.move

        actual = robot.report[:position_x] == 0 && robot.report[:position_y] == 0 && move_response[:execution_succesful] == false
        expected = true
        assert_equal(expected, actual)
    end

    def test_move_north_within_boundary
        robot = Robot.new(5,5)
        robot.place("0,0,NORTH")
        move_response = robot.move

        actual = robot.report[:position_x] == 0 && robot.report[:position_y] == 1 && move_response[:execution_succesful]
        expected = true
        assert_equal(expected, actual)
    end

    def test_move_north_off_boundary
        robot = Robot.new(5,5)
        robot.place("0,4,WEST")
        move_response = robot.move

        actual = robot.report[:position_x] == 0 && robot.report[:position_y] == 4 && move_response[:execution_succesful] == false
        expected = true
        assert_equal(expected, actual)
    end

    def test_move_south_within_boundary
        robot = Robot.new(5,5)
        robot.place("0,4,SOUTH")
        move_response = robot.move

        actual = robot.report[:position_x] == 0 && robot.report[:position_y] == 3 && move_response[:execution_succesful]
        expected = true
        assert_equal(expected, actual)
    end

    def test_move_south_off_boundary
        robot = Robot.new(5,5)
        robot.place("0,0,WEST")
        move_response = robot.move

        actual = robot.report[:position_x] == 0 && robot.report[:position_y] == 0 && move_response[:execution_succesful] == false
        expected = true
        assert_equal(expected, actual)
    end

end
class Robot_Place_Object_Test < MiniTest::Test
    def test_place_object_in_valid_position
        robot = Robot.new(5,5)
        robot.place("0,0,EAST")
        place_response = robot.place_object

        actual = place_response[:execution_succesful]
        expected = true
        assert_equal(expected, actual)
    end

    def test_place_object_in_valid_position_2
        robot = Robot.new(5,5)
        robot.place("4,4,SOUTH")
        place_response = robot.place_object

        actual = place_response[:execution_succesful]
        expected = true
        assert_equal(expected, actual)
    end

    def test_place_object_in_invalid_position
        robot = Robot.new(5,5)
        robot.place("0,0,WEST")
        place_response = robot.place_object

        actual = place_response[:execution_succesful]
        expected = false
        assert_equal(expected, actual)
    end

    def test_place_object_in_invalid_position_2
        robot = Robot.new(5,5)
        robot.place("0,4,NORTH")
        place_response = robot.place_object

        actual = place_response[:execution_succesful]
        expected = false
        assert_equal(expected, actual)
    end
end