class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token

  # def sign_in_with(provider_name)
  # @user = User.from_omniauth(request.env["omniauth.auth"])
  # sign_in_and_redirect @user, :event => :authentication
  # set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
  # end

  def all
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.user_attributes"] = @user.attributes
      puts @user.errors
      redirect_to new_user_session_path
    end
  end
  alias_method :github, :all

  def facebook
    sign_in_with "Facebook"
  end
  # def github
  # @user = User.from_omniauth(request.env["omniauth.auth"])
  # if @user.persisted?
  # sign_in_and_redirect @user
  # set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
  # else
  # flash[:error] = 'There was a problem signing you in through Github. Please register or try signing in later.'
  # redirect_to new_user_registration_url
  # end
  # end
  def linkedin
    sign_in_with "LinkedIn"
  end
  def twitter
    sign_in_with "Twitter"
  end
  def google_oauth2
    sign_in_with "Google"
  end
  def developer
    sign_in_with "Developer"
  end
end
