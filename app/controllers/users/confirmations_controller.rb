# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def new
    @user = User.new
  end
  
  def show
::Rails::logger.info '======show======'
::Rails::logger.info params[:confirmation_token]
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token]) if params[:confirmation_token].present?
::Rails::logger.info self.resource
::Rails::logger.info resource
    super if resource.nil? or resource.confirmed?
  end

  def confirm
::Rails::logger.info '======confirm======'
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token]) if params[:confirmation_token].present?
::Rails::logger.info '======confirm1======'
    confirmation_token = params[resource_name][:confirmation_token]
::Rails::logger.info '======confirm2======'
    self.resource = resource_class.find_by_confirmation_token!(confirmation_token)
::Rails::logger.info '======confirm3======'
::Rails::logger.info confirm_params
    if resource.update_attributes(confirm_params)
      self.resource = resource_class.confirm_by_token(confirmation_token)
      set_flash_message :notice, :confirmed
      sign_in_and_redirect(resource_name, resource)
    else
      render :action => "show"
    end
  end

  private
    def confirm_params
      params.require(resource_name).permit(:password, :password_confirmation)
    end
end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end

