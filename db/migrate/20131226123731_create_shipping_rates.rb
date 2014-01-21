class CreateShippingRates < ActiveRecord::Migration
  def change
    create_table :shipping_rates do |t|
      t.references :shipment, index: true
      t.references :shipping_method

      t.timestamps
    end

    add_index(:shipping_rates, [:shipment_id, :shipping_method_id], unique: true)
  end
end
