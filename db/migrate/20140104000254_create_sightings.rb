class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.integer :observation_id
      t.integer :species_id
      t.integer :count

      t.timestamps
    end
  end
end
