class ApplicationController < ActionController::Base
  before_action :items
def items
  @categories=Category.all
  @brands = Brand.all
  @stores = Store.all
end
        # Prevent CSRF attacks by raising an exception.
        protect_from_forgery with: :exception
        before_action :configure_permitted_parameters, if: :devise_controller?
        # before_action :authenticate_user!
        protected
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar,:role,:isActive])
          devise_parameter_sanitizer.permit(:account_update, keys: [:avatar,:role,:isActive])

        end

        #to redirect if user not authorized to access this page
        rescue_from CanCan::AccessDenied do |exception|
          respond_to do |format|
              format.json { head :forbidden }
              format.html { redirect_to root_path, :alert => exception.message }
          end
        end

end
