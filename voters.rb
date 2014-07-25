def runoff(voters)
  return nil if voters.empty?
  return voters[0][0] if voters.length == 1
  
  voters_count = voters.max_by{|x| x.length}.length
  voters_rank = {}
  
  voters.each do|row|
    v = row[0] 
    voters_rank[v] ||= 0
    voters_rank[v] += 1
  end
  
  # select winners
  winners = voters_rank.select{|k, v| v == voters_rank.values.max}
  
  # all draw
  return nil if winners.length == voters_count
  # first wins if 50%+
  return winners.keys[0] if winners.values[0] >= voters_rank.values.reduce(:+)/2
  # remove loosers
  loosers = voters_rank.select{|k, v| v == voters_rank.values.min}
  #increment next choice
  loosers.keys.each do |l|
    voters.each do |row|
      next unless row[0] == l
      voters_rank[row[1]] += 1
    end
  end
  voters.each{|row| loosers.keys.each{|x| row.delete(x)}}
  # run again
  runoff(voters)
end

require 'minitest/spec'
require 'minitest/autorun'

describe "loop_size" do
  it "passes" do
    voters = [[:dem, :ind, :rep],
          [:rep, :ind, :dem],
          [:ind, :dem, :rep],
          [:ind, :rep, :dem]]
    runoff(voters).must_equal :ind


    voters = [[:dem, :ind, :sam],
          [:rep, :ind, :dem],
          [:sam, :dem, :rep],
          [:ind, :sam, :dem]]
    runoff(voters).must_equal :ind
  end
end