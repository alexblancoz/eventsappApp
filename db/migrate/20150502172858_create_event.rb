class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :address, :description
      t.integer :price
      t.float :latitude, :longitude
      t.timestamp :start_date, :end_date
      t.timestamps
    end
  end
end
