class CreatePropertiesPrototypes < ActiveRecord::Migration
  def change
    create_table :properties_prototypes do |t|
      t.references :property
      t.references :prototype

      t.timestamps
    end
  end
end
