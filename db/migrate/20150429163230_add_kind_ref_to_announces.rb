class AddKindRefToAnnounces < ActiveRecord::Migration
  def change
    add_reference :announces, :kind, index: true
    add_foreign_key :announces, :kinds
  end
end
