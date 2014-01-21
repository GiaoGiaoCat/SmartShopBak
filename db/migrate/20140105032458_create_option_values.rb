class CreateOptionValues < ActiveRecord::Migration
  def change
    create_table :option_values do |t|
      t.string :name
      t.string :presentation
      t.integer :position
      t.integer :option_type_id

      t.timestamps
    end
  end
end
