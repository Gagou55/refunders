class AddCancelledToAnnounces < ActiveRecord::Migration
  def change
    add_column :announces, :cancelled, :boolean
  end
end
