class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :city_id
      t.float :walkers
      t.float :cyclists
      t.float :property_val
      t.float :population

      t.timestamps
    end
  end
end
