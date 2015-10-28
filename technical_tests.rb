require 'minitest/autorun'
require './technical'

class TechnicalTest < Minitest::Test

  def setup
    @tech = TechnicalQuestion.new
  end

  def test_sum_from_1_to_100
    sum = 5050
    assert_equal(sum, @tech.task_1)
  end

  def test_string_to_array_splitting
    str = "Fizz::Buzz::Wizz"
    result_arr = ["Fizz::Buzz::Wizz", "Fizz::Buzz", "Fizz"]
    assert_equal(result_arr, @tech.task_2_3(str))
  end

  def test_string_to_array_splitting_with_pipe_delimeter
    str = "Fizz|Buzz|Wizz"
    result_arr = ["Fizz|Buzz|Wizz", "Fizz|Buzz", "Fizz"]
    assert_equal(result_arr, @tech.task_2_3(str, '|'))
  end

  def test_minimum_count
    arr = [1,4,3,2]
    wrong_arr = [1,2,2]
    x = 6
    assert_equal([2, '4, 3'], @tech.task_4(arr, x))
    assert_equal("Unsatisfied Array", @tech.task_4(wrong_arr, x))
  end

  def test_maximum_count
    arr = [1,4,3,2]
    wrong_arr = [7,10,9,15]
    x = 6
    assert_equal([3, '1, 2, 3'], @tech.task_5(arr, x))
    assert_equal("Unsatisfied Array", @tech.task_5(wrong_arr, x))
  end

end
