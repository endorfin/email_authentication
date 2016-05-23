module EmailAuthentication
  class LoginsController < ApplicationController

    def create
      email = params[:email]

      if login_with_signup?
        user_session = UserSession.find_or_create_by(email: email)
      else
        user_session = UserSession.find_by(email: email)
      end

      if user_session
        user_session.update!(login_token: SecureRandom.urlsafe_base64,
                     login_token_valid_until: Time.now + 15.minutes)

        EmailAuthenticationMailer.login_link(user_session).deliver

        handle_login_create
      else
        handle_login_failed
      end
    end

  end
end
