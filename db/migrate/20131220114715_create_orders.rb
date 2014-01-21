class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string      :number, limit: 32
      t.references  :user, index: true
      t.decimal     :item_total, precision: 10, scale: 2, default: 0.0, null: false
      t.decimal     :total, precision: 10, scale: 2, default: 0.0, null: false
      t.string      :currency
      t.string      :state
      t.datetime    :completed_at
      t.text        :special_instructions
      t.integer     :ship_address_id
      t.integer     :shipping_method_id
      t.string      :shipment_state
      t.decimal     :payment_total, precision: 10, scale: 2, default: 0.0
      t.string      :payment_state

      t.timestamps
    end

    add_index :orders, :number
    add_index :orders, :completed_at
  end
end
