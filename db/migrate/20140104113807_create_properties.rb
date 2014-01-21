class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :presentation, null: false

      t.timestamps
    end
  end
end
