ActiveAdmin.register Building do
permit_params :description, :image

form do |f|
	f.inputs 'Admin Details' do
		f.input :description
		f.input :image, :as => :file
	end
	f.actions
end

index do
	selectable_column
	id_column

	column :description
    column :image do |event|
    link_to(image_tag(event.image.url(:medium)))
  end
    actions

end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end