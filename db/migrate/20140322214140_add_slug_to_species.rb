class AddSlugToSpecies < ActiveRecord::Migration
  def change
    add_column :species, :slug, :string
    add_index :species, :slug, unique: true
  end
end
