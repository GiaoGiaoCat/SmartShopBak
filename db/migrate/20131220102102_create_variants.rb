class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string      :sku, default: "", null: false
      t.datetime    :deleted_at
      t.references  :product, index: true
      t.integer     :position
      t.decimal     :weight, precision: 8, scale: 2
      t.decimal     :height, precision: 8, scale: 2
      t.decimal     :width, precision: 8, scale: 2
      t.decimal     :depth, precision: 8, scale: 2
      t.decimal     :cost_price, precision: 8, scale: 2
      t.string      :cost_currency
      t.boolean     :is_master, default: false

      t.timestamps
    end

    add_index :variants, :sku
  end
end
