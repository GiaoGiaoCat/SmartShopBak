class CreateShippingMethodCategories < ActiveRecord::Migration
  def change
    create_table :shipping_method_categories do |t|
      t.references :shipping_method, null: false, index: true
      t.references :shipping_category, null: false, index: true

      t.timestamps
    end
  end
end
