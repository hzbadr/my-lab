class Calculator

  def evaluate(expr)
    return expr.to_i unless expr.include? ' ' 
    return expr.gsub(/\*|\+\/\-/, ''),to_i if expr.length < 5
    return send(expr[2], expr[0].to_i, expr[4].to_i) if expr.length <= 5

    expr = expr.split(/\s?(\+|-)\s?/)
    xx = expr.collect do |x|
      if %w(+ -).include? x
        x
      else
        while x.length > 5
          x = x.gsub(/^(.{5})/, evaluate(x[0..4]).to_s) 
        end
        evaluate(x)
      end
    end

    while xx.length >= 3
      s = send(xx[1], xx[0].to_i, xx[2].to_i)
      xx = [s] + xx[3..-1]
    end
    xx[0]
  end

  def /(x, y)
    x/y
  end

  def *(x, y)
    x*y
  end

  def +(x, y)
    x+y
  end

  def -(x, y)
    x-y
  end

end

# puts Calculator.new.evaluate("4 / 2")
# puts Calculator.new.evaluate("2 / 2 + 3 * 4 - 6 * 1 * 1 / 1 + 1 / 1")
# puts Calculator.new.evaluate("127")
puts Calculator.new.evaluate("10 * ")
# puts Calculator.new.evaluate([1, "+", 12, "-", 6, "+", 1][0..2].join(' '))