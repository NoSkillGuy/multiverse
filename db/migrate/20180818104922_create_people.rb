class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.integer :universe_id
      t.integer :family_id
      t.string :name
      t.boolean :power

      t.timestamps
    end
    add_index :people, [:universe_id, :family_id]
  end
end
