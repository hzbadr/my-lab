def ip_to_int32(ip)
  ip.split('.').map do|x|
    "%08b" % x
  end.join.to_i(2)
end

require 'minitest/spec'
require 'minitest/autorun'

describe "ip_to_int32" do
  it "passes" do
    ip_to_int32("128.32.10.1").must_equal 2149583361
  end
end
