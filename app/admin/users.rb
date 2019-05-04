ActiveAdmin.register User do


permit_params :isActive
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#
#
  # controller do
  #   def store
  #         Store.find_by(self.id)
  #   end
  # end
controller do
  def assign
    @stores=Store.new
  end
end

stores=Store.all
  form do |f|
    f.inputs do
      f.input :email
      f.input :created_at
      f.input :updated_at
      # f.input :role
      f.input :role ,:label => 'Store' ,as: :select,:collection =>stores
      f.input :isActive
    end
    f.actions
  end
end
