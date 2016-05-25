module EmailAuthentication
  class SessionsController < ApplicationController

    def create
      authentication_service = AuthenticationService.new(params[:token])

      if authentication_service.valid?
        session[::EmailAuthentication::SESSION_KEY] = authentication_service.session_key

        authentication_service.expire_token!

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
