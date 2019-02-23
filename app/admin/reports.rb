ActiveAdmin.register Report do
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
permit_params :user_email,:subject, :text, photos: []
form(html: { multipart: true }) do |f|
    f.inputs do
      f.input :user_email
      f.input :subject
      f.input :text
      f.file_field :photos, multiple: true
    end
   f.actions
end
end
