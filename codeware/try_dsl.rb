class Dsl
  attr_accessor :params

  def initialize params
    @params = params
    yield self if block_given?
  end

end

# LOL Ruby is cool!
puts ->{Dsl.new('Hello World') do |dsl| 
  dsl.params = 'My new Hello World'
end}.call.params

