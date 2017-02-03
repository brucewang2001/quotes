class CreateThewords < ActiveRecord::Migration[5.0]
  def change
    create_table :thewords do |t|
      t.datetime :sharedate
      t.string :thequote
      t.string :review

      t.timestamps
    end
  end
end
