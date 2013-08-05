class CreateHammingCodes < ActiveRecord::Migration
  def change
    create_table :hamming_codes do |t|
      t.string :raw_code
      t.string :hamming_code

      t.timestamps
    end
  end
end
