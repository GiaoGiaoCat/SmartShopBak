class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal     :amount
      t.references  :order, index: true
      t.integer     :source_id
      t.string      :source_type
      t.integer     :payment_method_id
      t.string      :state
      t.string      :response_code
      t.string      :avs_response
      t.string      :identifier
      t.string      :cvv_response_code
      t.string      :cvv_response_message

      t.timestamps
    end
  end
end
