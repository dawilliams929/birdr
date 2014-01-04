class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.integer :location_id
      t.integer :user_id
      t.datetime :date

      t.timestamps
    end
  end
end
