class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.string      :value
      t.references  :product, index: true
      t.references  :property
      t.integer     :position, default: 0

      t.timestamps
    end
  end
end
