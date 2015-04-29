class RemoveKindFromAnnounces < ActiveRecord::Migration
  def change
    remove_column :announces, :kind, :datatype
  end
end
