ActiveAdmin.register Store do

permit_params :name, :summary, :user_id

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
# #
# controller do
#
#   def store_params
#     params.require(:store).permit(:name, :summary,:user_id)
#   end
#
# end
#   form do |f|
#     f.inputs do
#       f.input :name
#       f.input :summary
#       f.input :user_id
#
#     end
#     f.actions
#   end

end
