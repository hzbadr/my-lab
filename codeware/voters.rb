def runoff(voters)
  voters_rank = {}
  while true
    voters.each do|row|
      v = row[0] 
      voters_rank[v] ||= 0
      voters_rank[v] += 1
    end
    
    winners = voters_rank.select{|k, v| v == voters_rank.values.max}  # select winners
    return winners.keys[0] if winners.values[0] > voters_rank.values.reduce(:+)/2 # first wins if 50%+

    # remove loosers from voters and voters_rank
    loosers = voters_rank.select{|k, v| v == voters_rank.values.min}
    loosers.keys.each{|k| voters_rank.delete(k)}
    voters.each{|row| loosers.keys.each{|x| row.delete(x)}}
  end
end

require 'minitest/spec'
require 'minitest/autorun'

describe "loop_size" do
  it "passes" do
    # voters = [[:dem, :ind, :rep],
    #           [:rep, :ind, :dem],
    #           [:ind, :dem, :rep],
    #           [:ind, :rep, :dem]]
    # runoff(voters).must_equal :ind

    # runoff([[:dem, :ind, :sam]]).must_equal :dem

    # runoff([[:dem, :ind, :sam], 
    #         [:ind, :dem, :sam]]).must_equal nil

    runoff([[:a, :c, :b, :d, :e], 
            [:d, :c, :a, :b, :e], 
            [:e, :b, :d, :a, :c], 
            [:e, :a, :b, :c, :d], 
            [:b, :c, :e, :a, :d]]).must_equal :e

  end
end