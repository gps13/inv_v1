class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :serial
      t.references :site
      t.references :location
      t.boolean :stockable
      t.references :itype

      t.timestamps
    end
    add_index :items, :site_id
    add_index :items, :location_id
    add_index :items, :itype_id
  end
end
