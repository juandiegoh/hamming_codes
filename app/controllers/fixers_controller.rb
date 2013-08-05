class FixersController < ApplicationController
  def create
    hamming_code_input = params[:fixer][:hamming_code_input]
    hc = HammingCodeCorrected.find_by_hamming_code_input(hamming_code_input)
    if hc.nil?
      corrector = HammingCodeCorrector.new
      puts "ALERTAAA!!!! Antes del corrector #{hamming_code_input}"
      raw_code = corrector.get_original_code(hamming_code_input)
      puts "ALERTAAA!!!! Despues del corrector #{hamming_code_input}"
      hc = HammingCodeCorrected.create(hamming_code_input: hamming_code_input, raw_code: raw_code)
    end

    redirect_to fixer_path(hc.id)
  end

  def show
    @hc = HammingCodeCorrected.find(params[:id])
  end

  def new
  end

  def index
    redirect_to action: :new
  end
end
