class GeneratorsController < ApplicationController

  def new
  end

  def create
    raw_code = params[:generator][:raw_code]
    hc = HammingCode.find_by_raw_code(raw_code)
    if hc.nil?
      factory = HammingCodeFactory.new
      hamming_code = factory.create_hamming_code(raw_code.to_s)
      hc = HammingCode.create(hamming_code: hamming_code, raw_code: raw_code)
    end

    redirect_to generator_path(hc.id)
  end

  def index
    redirect_to action: :new
  end

  def show
    @hc = HammingCode.find(params[:id])
  end

end
