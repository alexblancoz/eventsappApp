class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.boolean :favorite
      t.integer :user_id
      t.integer :event_id
      t.timestamps
    end
  end
end
