class RemovePriceFromAnnounce < ActiveRecord::Migration
  def change
    remove_column :announces, :price, :integer
  end
end
