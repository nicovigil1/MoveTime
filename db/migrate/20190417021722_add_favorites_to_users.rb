class AddFavoritesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :users, foreign_key: true
  end
end
