class CreateShippingMethods < ActiveRecord::Migration
  def change
    create_table :shipping_methods do |t|
      t.string    :name
      t.datetime  :deleted_at
      t.string    :display_on
      t.string    :admin_name
      t.string    :tracking_url

      t.timestamps
    end
  end
end
