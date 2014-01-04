class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :common_name
      t.string :scientific_name
      t.string :family

      t.timestamps
    end
  end
end
