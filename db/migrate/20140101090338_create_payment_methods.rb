class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string    :type
      t.string    :name
      t.text      :description
      t.boolean   :active,  default: true
      t.string    :environment, default: "development"
      t.datetime  :deleted_at
      t.string    :display_on

      t.timestamps
    end
  end
end
