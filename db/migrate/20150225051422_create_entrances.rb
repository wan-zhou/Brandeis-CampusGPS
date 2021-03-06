class CreateEntrances < ActiveRecord::Migration
  def change
    create_table :entrances do |t|
      t.string :photo
      t.belongs_to :building, index: true
      t.belongs_to :location
      t.belongs_to :floor

      t.timestamps null: false
    end
    add_foreign_key :entrances, :buildings
    add_foreign_key :entrances, :locations
    add_foreign_key :entrances, :floors
  end
end
