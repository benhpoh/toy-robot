require "minitest/autorun"
require "minitest/reporters"
require_relative "../lib/position"

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

class Init_Test < MiniTest::Test
    def test_init_nil_x_position
        position = Position.new(5, 5)
        actual = position.x
        assert_nil(actual)
    end

    def test_init_nil_y_position
        position = Position.new(5, 5)
        actual = position.y
        assert_nil(actual)
    end

    def test_init_nil_direction
        position = Position.new(5, 5)
        actual = position.direction
        assert_nil(actual)
    end
end

class Update_Position_Test < MiniTest::Test
    def test_update_x_position
        position = Position.new(5, 5)
        position.x = 3
        actual = position.x
        expected = 3
        assert_equal(expected, actual)
    end

    def test_update_y_position
        position = Position.new(5, 5)
        position.y = 2
        actual = position.y
        expected = 2
        assert_equal(expected, actual)
    end

    def test_update_direction
        position = Position.new(5, 5)
        position.direction = :EAST
        actual = position.direction
        expected = :EAST
        assert_equal(expected, actual)
    end
end