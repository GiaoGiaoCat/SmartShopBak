class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :name, default: "", null: false
      t.text     :description
      t.datetime :available_on
      t.datetime :deleted_at
      t.string   :permalink
      t.text     :meta_description
      t.string   :meta_keywords
      t.integer  :shipping_category_id
      t.text     :details

      t.timestamps
    end

    add_index :products, :name
    add_index :products, :available_on
    add_index :products, :deleted_at
    add_index :products, :permalink, unique: true
  end
end
