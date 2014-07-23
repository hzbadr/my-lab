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