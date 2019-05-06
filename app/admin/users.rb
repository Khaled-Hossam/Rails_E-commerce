ActiveAdmin.register User do


permit_params :isActive ,:email,
              store_attributes: [:id,:name, :user_id]

index do
  column :email
  column :created_at
  column :updated_at
  column :role
  column :isActive
end

  form do |f|
    f.inputs "user" do
      f.input :email
      f.input :created_at
      f.input :updated_at
      f.input :role
      f.input :isActive
    end
    f.actions
  end
end
