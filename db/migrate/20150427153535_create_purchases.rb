class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user, index: true
      t.references :announce, index: true

      t.timestamps null: false
    end
    add_foreign_key :purchases, :users
    add_foreign_key :purchases, :announces
  end
end
