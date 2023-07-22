class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
        redirect_back_or_to root_path, alert: exception.message
    end

    def after_sign_in_path_for(resource)
        user_path(current_user)
    end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
            devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
        end
end
