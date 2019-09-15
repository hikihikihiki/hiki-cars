class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
   def after_sign_in_path_for(resource)
   	  if resource.is_a?(User)
 	     user_path(resource)
       elsif resource.is_a?(Admin)
	     admin_root_path
      end
   end

   def after_inactive_sign_up_path_for(resource)
    mycars_path
   end

private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :livein])
  end
end
