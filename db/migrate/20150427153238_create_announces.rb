class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.string :title
      t.integer :price
      t.string :kind
      t.integer :number_of_share
      t.text :reason
      t.boolean :published
      t.references :company, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :announces, :companies
    add_foreign_key :announces, :users
  end
end
