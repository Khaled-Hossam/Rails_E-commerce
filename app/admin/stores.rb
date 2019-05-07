ActiveAdmin.register Store , :as => "fancy_stores" do

  permit_params :name, :summary, :user_id

  # users=User.where(role: "seller")
  form do |f|
    f.inputs do
      f.input :name
      f.input :summary
      f.input :user_id  ,as: :select ,:collection =>User.where(role: "seller")

    end
    f.actions
  end

end
