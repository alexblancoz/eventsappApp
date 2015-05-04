class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :password, :name, :last_names, :phone, :photo_file_name
      t.date :birthdate
      t.timestamps
    end
  end
end
