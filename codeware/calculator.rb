class Calculator
  # simple calculator parser.

  REGEX = {
    :/ => /([-+]?[0-9]*\.?[0-9]+\s[\/]\s[-+]?[0-9]*\.?[0-9]+)/,
    :* => /([-+]?[0-9]*\.?[0-9]+\s[\*]\s[-+]?[0-9]*\.?[0-9]+)/,
    :- => /([-+]?[0-9]*\.?[0-9]+\s[-]\s[-+]?[0-9]*\.?[0-9]+)/,
    :+ => /([-+]?[0-9]*\.?[0-9]+\s[\+]\s[-+]?[0-9]*\.?[0-9]+)/
  }

  def evaluate(expr)
    return expr.gsub(/\s[\+|-|\*|\/]\s/, '').to_i unless expr.match /(\d+\s[\*|\/|\+|-]\s\d+)/

    @expr = expr

    REGEX.keys.each do |operation|
      reduce(operation)
    end

    @expr.to_i
  end

  def reduce(operation)
    while @expr.match REGEX[operation]
      @expr.scan(REGEX[operation]) { |match|  calc(match[0]) if match}
    end
  end

  def calc(match)
    splitted = match.split(' ')
    @expr = @expr.sub(match, splitted[0].to_f.send(splitted[1], splitted[2].to_f).to_s)
  end

end

puts Calculator.new.evaluate("4 / 2") == 2
puts Calculator.new.evaluate("2 - 3 - 4") == -5
puts Calculator.new.evaluate("10 * 5 / 2") == 25 
puts Calculator.new.evaluate("2 + 3 * 4 / 3 - 6 / 3 * 3 + 8") == 8
puts Calculator.new.evaluate("2 * 1 * 9 * 3 * 6 * 2 * 1 * 1 * 3 * 4") == 7776
# puts Calculator.new.evaluate("4 + 2")
# puts Calculator.new.evaluate("2 / 2 + 3 * 4 - 6 * 1 * 1 / 1 + 1 / 1")
# puts Calculator.new.evaluate("127")
# puts Calculator.new.evaluate("10 * ")
# puts Calculator.new.evaluate([1, "+", 12, "-", 6, "+", 1][0..2].join(' '))