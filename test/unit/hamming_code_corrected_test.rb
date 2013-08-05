require 'test_helper'

class HammingCodeCorrectedTest < ActiveSupport::TestCase

  test "Hamming Code Corrected" do
     @raw_code = HammingCodeCorrector.new.get_original_code('010101100011')
     assert_equal("00110011", @raw_code)
  end

    test "Hamming Code Corrected 2" do
     @raw_code = HammingCodeCorrector.new.get_original_code('011100101110')
     assert_equal('10011010', @raw_code)
  end

    test "Hamming Code Corrected 3" do
     @raw_code = HammingCodeCorrector.new.get_original_code('011100101010')
     assert_equal('10011010', @raw_code)
  end
end
