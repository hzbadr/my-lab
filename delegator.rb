require 'delegate'

class Car

  attr_reader :price

  def initialize price
    @price = price
  end
end


class VTACalculator < SimpleDelegator
  def new_price
    price * 1.23
  end
end


car = Car.new(120)
car_with_tax = VTACalculator.new car
puts car_with_tax.class
puts car_with_tax.new_price
