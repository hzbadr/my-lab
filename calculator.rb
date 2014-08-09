class Calculator
  # simple calculator parser.

  def evaluate(expr)
    return expr.gsub(/\s[\+|-|\*|\/]\s/, '').to_i unless expr.match /(\d+\s[\*|\/|\+|-]\s\d+)/

    @expr = expr

    while @expr.match /(\d+\s[\*|\/]\s\d+)/
      @expr.scan(/(\d+\s[\*|\/]\s\d+)/) { |match|  calc(match[0]) if match}
    end
    
    while @expr.match /(-?\d+\s[-]\s\d+)/
      @expr.scan(/(-?\d+\s[-]\s\d+)/) { |match|  calc(match[0]) if match}
    end

    while @expr.match /(-?\d+\s[+]\s\d+)/
      @expr.scan(/(-?\d+\s[+]\s\d+)/) { |match|  calc(match[0]) if match}
    end

    @expr.to_i
  end

  def calc(match)
    splitted = match.split(' ')
    @expr = @expr.gsub(match, send(splitted[1], splitted[0].to_i, splitted[2].to_i).to_s)
  end

  %w(/ * + -).each do |operation|
    define_method operation do |x, y|
      x.send(operation, y)
    end
  end

end

# puts Calculator.new.evaluate("4 / 2")
# puts Calculator.new.evaluate("2 - 3 - 4")
puts Calculator.new.evaluate("2 + 3 * 4 / 3 - 6 / 3 * 3 + 8")
# puts Calculator.new.evaluate("4 + 2")
# puts Calculator.new.evaluate("2 / 2 + 3 * 4 - 6 * 1 * 1 / 1 + 1 / 1")
# puts Calculator.new.evaluate("127")
# puts Calculator.new.evaluate("10 * ")
# puts Calculator.new.evaluate([1, "+", 12, "-", 6, "+", 1][0..2].join(' '))