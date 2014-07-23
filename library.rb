class Library 
  def initialize
    @books = []
  end

  def <<(book)
    @books << book
  end

  def to_s
    "Library contents:\n#{@books.join("\n")}"
  end
end

class Book
  attr_accessor :author, :title
  
  def initialize(options)
    @author = options[:author]
    @title = options[:title]
    options[:library] << self
  end

  def to_s
    "Title: #{title}, Author: #{author}"
  end
end

my_library = Library.new

Book.new(:author => "Herman Melville", :title => "Moby-Dick", :library => my_library)
Book.new(:author => "Hans Christian Andersen", :title => "The Ugly Duckling", :library => my_library)

puts my_library.to_s


#V1
def clever_print(*args)
  result = args.collect do |a|
    if a.is_a? Hash
      a.collect {|k,v| "#{k} #{v}"}.join(' ')
    elsif a.is_a? Array
      a.flatten.join(' ')
    else
      a
    end
  end.join(' ')

  puts result
end

#V2
def clever_print(*args)
  result = args.collect do |a|
    if a.respond_to? :to_a
      a.to_a
    else
      a
    end
  end.join(' ')

  puts result
end

clever_print(["Ruby"], "the", ["Programming", "Language"])

clever_print(["Agile", "Web", "Development"], "with", { :Rails => 3.0 })