def title_case(title, minor_words="")
  [title, minor_words].map(&:downcase!)
  return "" if title.empty?
  return title.capitalize if minor_words == title

  minor_splitted =  minor_words.split(' ')
  words = title.capitalize.split(' ')
  words.collect{ |w| minor_splitted.include?(w) ? w : w.capitalize }.join(' ')
end