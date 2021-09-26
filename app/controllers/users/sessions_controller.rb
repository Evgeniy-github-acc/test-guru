class Users::SessionsController < Devise::SessionsController
  
  before_action :configure_permited_params, only: [:create]
    
  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message! :notice, 
                       :signed_in, :first_name => resource.first_name,
                                   :last_name => resource.last_name
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    super
  end
  
  protected

  def configure_permited_params
   devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name])
  end
end
