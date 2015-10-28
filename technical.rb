class TechnicalQuestion
  def task_1(max = 100)
    sum = (1..max).inject(:+)
    alt_sum = (max/2.0 * (max + 1)).to_i # alternate solution
    puts "Sum of numbers between 1 and #{max} is #{sum}"
    puts "Sum of numbers between 1 and #{max} is #{alt_sum}"
    return sum
  end

  def task_2_3(string, delimeter="::")
    result = []
    arr = string.split(delimeter)
    arr.length.downto(1) do |el|
      result << arr.first(el).join(delimeter)
    end
    return result
  end

  def task_4(array, x)
    numbers, sum = [], 0
    array.sort.reverse.each do |el| # the best solution(please see benchmark.rb)
      numbers << el
      sum += el # the fastest solution(please see benchmark.rb)
      return numbers.length, numbers.join(', ') if sum >= x
    end
    return "Unsatisfied Array"
  end

  def task_5(array, y)
    array.sort!
    return "Unsatisfied Array" if array.first > y
    numbers, sum = [], 0
    array.each do |el|
      return numbers.length, numbers.join(', ') if sum + el > y
      sum += el
      numbers << el
    end
  end

  def task_6
    File.open("./TDD_bullets.txt", "r") do |f|
      f.each_line do |line|
        puts line
      end
    end
  end
end
