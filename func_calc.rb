def zero(calc=nil)
  calc.nil? ? 0.0 : calc.(0)
end
def one(calc=nil)
  calc.nil? ? 1.0 : calc.(1)
end
def two(calc=nil)
  calc.nil? ? 2.0 : calc.(2)
end
def three(calc=nil)
  calc.nil? ? 3.0 : calc.(3)
end
def four(calc=nil)
  calc.nil? ? 4.0 : calc.(4) 
end
def five(calc=nil)
  calc.nil? ? 5.0 : calc.(5)
end
def six(calc=nil)
  calc.nil? ? 6.0 : calc.(6)
end
def seven(calc=nil)
  calc.nil? ? 7.0 : calc.(7)
end
def eight(calc=nil)
  calc.nil? ? 8.0 : calc.(8)
end
def nine(calc=nil)
  calc.nil? ? 9.0 : calc.(9)
end

def plus(number)
  ->(x){ x + number}
end
def minus(number)
  ->(x){ x - number}
end
def times(number)
  ->(x){ x * number}
end
def divided_by(number)
  ->(x){ x / number}
end

require 'minitest/spec'
require 'minitest/autorun'

describe "calculations" do
  it "passes" do
    five(minus(three)).must_equal two
    five(plus(two)).must_equal seven
  end
end