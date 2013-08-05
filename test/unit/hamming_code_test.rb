require 'test_helper'

class HammingCodeTest < ActiveSupport::TestCase
  test "Hamming Code Created" do
     @hamming_code = HammingCodeFactory.new.create_hamming_code('101')
     assert_equal('101101', @hamming_code)
  end
end
