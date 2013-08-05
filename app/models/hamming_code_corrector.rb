class HammingCodeCorrector

  def initialize
  end

  def get_original_code(hamming_code_input)
    hamming_code = String.new(hamming_code_input)
    control_bits = self.get_control_bits(hamming_code)
    raw_code = self.get_raw_code(hamming_code)
    puts "Control bits: #{control_bits}"
    puts "Raw bits: #{raw_code}"

    real_hamming_code = HammingCodeFactory.new.create_hamming_code(raw_code)
    real_control_bits = self.get_control_bits(real_hamming_code)

    get_correct_original_code(control_bits, real_control_bits, hamming_code, raw_code).join('')
  end

  def get_correct_original_code(control_bits, real_control_bits, hamming_code, raw_code)
    if(control_bits.eql?(real_control_bits))
      raw_code
    else
      error_bit_pos_array = []
      (0..real_control_bits.size()-1).each do |i|
        if control_bits[i] == real_control_bits[i]
          error_bit_pos_array.push(0)
        else
          error_bit_pos_array.push(1)
        end
      end
      fix_original_code(error_bit_pos_array, hamming_code)
    end
  end

  def fix_original_code(error_bit_pos_array, hamming_code)
    error_bit_pos = num_from_base2(error_bit_pos_array.reverse.join(""))
    if hamming_code[error_bit_pos-1] == '0'
      puts "Se cambia por un 1"
      hamming_code[error_bit_pos-1] = '1'
    else
      puts "Se cambia por un 0"
      hamming_code[error_bit_pos-1] = '0'
    end
      puts "Hamming Code modificado: #{hamming_code}"
      get_raw_code(hamming_code)
  end

  def num_from_base2(base2_str)
    base2_str.to_i(2)
  end

  def get_control_bits(hamming_code)
    cb_array = []
    (1..hamming_code.size()).each do |i|
      if(power_of_two(i))
        cb_array.push(hamming_code[i-1])
      end
    end
    cb_array
  end

  def get_raw_code(hamming_code)
    rc_array = []
    (1..hamming_code.size()).each do |i|
      if(!power_of_two(i))
        rc_array.push(hamming_code[i-1])
      end
    end
    rc_array
  end

  def power_of_two(n)
    Math.log(n) / Math.log(2) % 1 == 0
   end
end
