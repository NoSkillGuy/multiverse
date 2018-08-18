class CreateUniversesFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :universes_families, id: false do |t|
      t.integer :universe_id
      t.integer :family_id
    end
  end
end
