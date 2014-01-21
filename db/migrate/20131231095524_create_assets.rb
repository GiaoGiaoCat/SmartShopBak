class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string      :image
      t.references  :variant, index: true
      t.integer     :position
      t.string      :alt

      t.timestamps
    end
  end
end
