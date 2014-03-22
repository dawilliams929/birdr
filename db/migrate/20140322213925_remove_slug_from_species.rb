class RemoveSlugFromSpecies < ActiveRecord::Migration
  def change
    remove_column :species, :slug
  end
end
