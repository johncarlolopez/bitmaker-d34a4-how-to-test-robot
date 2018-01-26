require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    test_bot = Robot.new
    test_bot.foreign_model = 'Toyota'
    test_bot.needs_repairs = true
    # act
    actual_value = test_bot.station
    expected_value = 1
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    test_bot = Robot.new
    test_bot.vintage_model = true
    test_bot.needs_repairs = true
    # act
    actual_value = test_bot.station
    expected_value = 2
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    test_bot = Robot.new
    test_bot.needs_repairs = true
    # act
    actual_value = test_bot.station
    expected_value = 3
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    test_bot = Robot.new
    # act
    actual_value = test_bot.station
    expected_value = 4
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    test_bot = Robot.new
    # act
    actual_value = test_bot.prioritize_tasks
    expected_value = -1
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    test_bot = Robot.new
    test_bot.todos = [1,2,3,4]
    # act
    actual_value = test_bot.prioritize_tasks
    expected_value = 4
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    test_bot = Robot.new
    test_bot.todos = [1,2,3,4]
    # act
    actual_value = test_bot.prioritize_tasks
    expected_value = 4
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    test_bot = Robot.new
    test_bot.day_off = (Time.now + 60 * 60 * 24).day
    # act
    actual_value = test_bot.workday?(Time.now.day)
    expected_value = true
    # assert
    assert_equal(expected_value, actual_value)
  end

end
