class RemovePhotonameFromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :photoname
  end
end
