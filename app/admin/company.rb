ActiveAdmin.register Company do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :summary, :general_information, :business_model, :development, :vision, :swot, :team, :logo, :ipo_company_id, :sector_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  # form do |f|
  #   f.inputs "Project Details" do
  #     f.input :name
  #     f.input :logo, :required => false, :as => :file
  #     # Will preview the image when the object is edited
  #   end
  #   f.actions
  #  end

  # show do |ad|
  #   attributes_table do
  #     row :name
  #     row :logo do
  #       image_tag(ad.logo.url(:thumb))
  #     end
  #     # Will display the image on show object page
  #   end
  #  end

  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do
      f.input :name
      f.input :summary
      f.input :general_information
      f.input :business_model
      f.input :development
      f.input :vision
      f.input :swot
      f.input :team
      f.input :logo, :as => :file
      f.input :ipo_company
      f.input :sector
    end
    f.actions
  end


end
