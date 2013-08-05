class HammingCodeFactory

   def create_hamming_code(raw_code)
    transform_to_hamming_code(raw_code)
   end

   def transform_to_hamming_code(raw_code)
    hamming_chain = get_hamming_chain(raw_code, 1, "")
    complete_parity(hamming_chain)
   end

   def complete_parity(hamming_code)
    if hamming_code.include? "_"
      idx = hamming_code.index("_")
      pos = idx + 1
      number_of_ones = count_ones(hamming_code[idx, hamming_code.size - idx], pos)
      if(number_of_ones % 2 == 0)
        complete_parity(hamming_code.sub('_', '0'))
      else
        complete_parity(hamming_code.sub('_', '1'))
      end
    else
      return hamming_code
    end
   end

   def count_ones(code, pos)
    read_ones(code, pos, pos, 0)
   end

   def read_ones(code, pos, reads, ones)
    if code.nil? || code.empty?
      return ones
    elsif reads == 0
      jump_ones(code, pos, pos, ones)
    else
      if(code[0] == '1')
        read_ones(code[1, code.size - 1], pos, reads - 1, ones + 1)
      else
        read_ones(code[1, code.size - 1], pos, reads - 1, ones)
      end
    end
   end

   def jump_ones(code, pos, reads, ones)
    if code.nil? || code.empty?
      return ones
    end
    read_ones(code[pos, code.size - pos], pos, pos, ones)
   end

   def get_hamming_chain(raw_code, pos, hamming_chain)
    if raw_code.nil? || raw_code.empty?
      return hamming_chain
    end

    if power_of_two(pos)
      get_hamming_chain(raw_code, pos + 1, hamming_chain + "_")
    else
      get_hamming_chain(raw_code[1, raw_code.size - 1], pos + 1, hamming_chain + raw_code[0])
    end
   end

   def power_of_two(n)
    Math.log(n) / Math.log(2) % 1 == 0
   end
end

