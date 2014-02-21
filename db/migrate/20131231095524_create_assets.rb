class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string      :image
      t.references  :viewable, polymorphic: true
      t.integer     :position
      t.string      :alt

      t.timestamps
    end

    add_index :assets, [:viewable_id], name: 'index_assets_on_viewable_id'
    add_index :assets, [:viewable_type], name: 'index_assets_on_viewable_type'
  end
end
