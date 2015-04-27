class CreateIpoCompanies < ActiveRecord::Migration
  def change
    create_table :ipo_companies do |t|
      t.string :name
      t.string :logo

      t.timestamps null: false
    end
  end
end
