class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

# class CreateSectors < ActiveRecord::Migration
#   def change
#     create_table :sectors do |t|
#       t.string :name
#       t.timestamps null: false
#     end
#     add_foreign_key :sectors, :companies
#   end
# end