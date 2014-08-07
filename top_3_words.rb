def top_3_words(text)
 return [] if text.empty?
 
  ps = [' ', ',', ';', '.', '/']
  words = {}
  text_length = text.length

  (0..text_length).inject('') do |word, i|
    if ps.include?(text[i]) || i == text_length
      words[word] = (words.fetch(word, 0) + 1) unless word.empty?
      word = ''
    else
      word += text[i].downcase
    end
  end
  
  top_values = words.values.sort.reverse.uniq[0...3]
  words = words.select{|k, v| top_values.include? v }
  words.sort_by{|k, v| -v}.map(&:first)[0...3]
end

top_3_words("a a A b b  c c c d d e")
top_3_words(" a a bb bb")
# top_3_words("  //wont won't won't")

require 'minitest/spec'
require 'minitest/autorun'

describe "top_3_words" do
  it "passes" do
    # top_3_words("a a a b b b ").must_equal 2149583361
  end
end
