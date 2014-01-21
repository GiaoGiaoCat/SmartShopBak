class CreateOptionTypesPrototypes < ActiveRecord::Migration
  def change
    create_table :option_types_prototypes do |t|
      t.integer :prototype_id
      t.integer :option_type_id
    end
  end
end
