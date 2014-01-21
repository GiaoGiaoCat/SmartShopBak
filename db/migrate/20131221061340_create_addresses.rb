class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :zipcode
      t.string :phone
      t.string :city
      t.string :province
      t.string :district
      t.string :address
      # t.references  :user, index: true

      t.timestamps
    end

    add_index :addresses, :name
    add_index :addresses, :phone
  end
end
