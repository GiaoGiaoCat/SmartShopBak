class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.references  :variant, null: false
      t.string      :currency
      t.decimal     :amount, precision: 8, scale: 2
      t.timestamps
    end
  end
end
