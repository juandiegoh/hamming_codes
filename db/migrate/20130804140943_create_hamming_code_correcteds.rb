class CreateHammingCodeCorrecteds < ActiveRecord::Migration
  def change
    create_table :hamming_code_correcteds do |t|
      t.string :hamming_code_input
      t.string :raw_code

      t.timestamps
    end
  end
end
