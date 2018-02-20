class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  def verify
    @user = User.find_by(id: session[:pre_2fa_id])
  end

  def check_2fa
    user = User.find(session[:pre_2fa_id])
    token = Authy::API.verify(id: user.authy_id, token: params[:token])
    if token.ok?
      sign_in(user, scope: :user)
      flash[:notice] = 'Signed in!!'
      session[:pre_2fa_id] = nil
      redirect_to root_path
    else
      flash[:alert] = 'Sorry, code was incorrect'
      redirect_to new_user_session_path
    end
  end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params.dig(:user, :email))
    if user && user.valid_password?(params.dig(:user, :password))
      session[:pre_2fa_id] = user.id
      Authy::API.request_sms(id: user.authy_id)
      redirect_to users_verify_path
    else
      new
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
# self.resource = warden.authenticate!(auth_options)
# set_flash_message!(:notice, :signed_in)
# sign_in(resource_name, resource)