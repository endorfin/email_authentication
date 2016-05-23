module EmailAuthentication
  class SessionsController < ApplicationController

    def create
      user_session = UserSession.where(login_token: params[:token]).where('login_token_valid_until > ?', Time.now).first

      if user_session
        session[::EmailAuthentication::SESSION_KEY] = user_session.id
        user_session.update!(login_token: nil, login_token_valid_until: 1.year.ago) # expire token

        handle_authorized
      else
        handle_token_invalid
      end
    end

    def destroy
      session[::EmailAuthentication::SESSION_KEY] = nil

      handle_logged_out
    end

  end
end
