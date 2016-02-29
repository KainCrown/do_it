class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    process_request(:facebook)
  end

  def github
    process_request(:github)
  end

  def linkedin
    process_request(:linkedin)
  end

  def process_request(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user, event: :authentication
  end
end
