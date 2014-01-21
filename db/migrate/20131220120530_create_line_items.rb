class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references  :variant, index: true
      t.references  :order, index: true
      t.decimal     :price, precision: 8, scale: 2, null: false
      t.integer     :quantity, null: false
      t.string      :currency
      t.decimal     :cost_price, precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end
