ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :first_name, :last_name, :address, :zip_code, :city, :phone, :email
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :city
    column :phone
    column :email
    # column :created_at
    column :admin
    actions
  end

end
