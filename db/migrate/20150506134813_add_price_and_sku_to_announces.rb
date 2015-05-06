class AddPriceAndSkuToAnnounces < ActiveRecord::Migration
  def change
    change_table :announces do |t|
      t.monetize :price, currency: { present: false }
      t.string :sku
    end
  end
end
