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
  puts words
  top_values = words.values.sort.reverse.uniq[0...3]
  return [words.values[0]] if top_values.length == 1
  words = words.select{|k, v| top_values.include? v }
  words.sort_by{|k, v| -v}.map(&:first)
end

top_3_words(", e .. ").inspect
# top_3_words("a a A b b  c c c d d e")
# top_3_words(" a a bb bb cc cc dd dd")
# top_3_words("  //wont won't won't")

require 'minitest/spec'
require 'minitest/autorun'

describe "top_3_words" do
  it "passes" do
    # top_3_words(" a a bb bb cc cc dd dd").must_equal ["a", "bb", "cc", "dd"]
  end
end
