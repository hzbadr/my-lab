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
