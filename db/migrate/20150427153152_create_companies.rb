class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :summary
      t.text :general_information
      t.text :business_model
      t.text :development
      t.text :vision
      t.text :swot
      t.text :team
      t.string :logo
      t.references :ipo_company, index: true

      t.timestamps null: false
    end
    add_foreign_key :companies, :ipo_companies
  end
end
