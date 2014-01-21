class CreateOptionValuesVariants < ActiveRecord::Migration
  def change
    create_table :option_values_variants do |t|
      t.references :variant, index: true
      t.references :option_value, index: true
    end
  end
end
