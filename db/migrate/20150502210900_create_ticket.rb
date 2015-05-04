class CreateTicket < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :identity
      t.integer :user_id, :event_id
      t.timestamps 
    end
  end
end
