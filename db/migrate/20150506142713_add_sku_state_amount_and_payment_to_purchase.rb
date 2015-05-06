class AddSkuStateAmountAndPaymentToPurchase < ActiveRecord::Migration
  def change
    change_table :purchases do |t|
      t.monetize :amount, currency: { present: false }
      t.string :announce_sku
      t.string :state
      t.json :payment
    end
  end
end
