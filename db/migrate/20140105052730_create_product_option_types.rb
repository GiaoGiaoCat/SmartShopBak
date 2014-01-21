class CreateProductOptionTypes < ActiveRecord::Migration
  def change
    create_table :product_option_types do |t|
      t.integer :position
      t.integer :product_id
      t.integer :option_type_id

      t.timestamps
    end
  end
end
