# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    include RackSessionFix
    respond_to :json
    before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]
    
    
    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end
    
    # protected
    
    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name])
    end
    
    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end
    
    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end
    
    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
    
    respond_to :json
    private
    
    def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
        render json: {
        status: {code: 200, message: "Signed up sucessfully."},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }, status: :ok
    elsif request.method == "DELETE"
        render json: {
        status: { code: 200, message: "Account deleted successfully."}
        }, status: :ok
    else
        render json: {
        status: {code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
        }, status: :unprocessable_entity
    end
end
end
