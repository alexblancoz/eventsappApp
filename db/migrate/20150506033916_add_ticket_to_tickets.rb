class AddTicketToTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :identity
    add_column :tickets, :ticket, :boolean
  end
end
