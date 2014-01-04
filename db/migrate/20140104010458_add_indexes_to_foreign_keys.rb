class AddIndexesToForeignKeys < ActiveRecord::Migration
  def change
    add_index :observations, :user_id
    add_index :observations, :location_id
    add_index :sightings, :observation_id
    add_index :sightings, :species_id
  end
end
