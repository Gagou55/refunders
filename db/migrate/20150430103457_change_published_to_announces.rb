class ChangePublishedToAnnounces < ActiveRecord::Migration
  def change
    change_column :announces, :published, :boolean, :default => false
  end
end
