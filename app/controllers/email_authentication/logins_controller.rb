module EmailAuthentication
  class LoginsController < ApplicationController

    def create
      login_service = LoginService.new(params[:email], login_with_signup?)

      if login_service.successful?
        login_service.renew_token!

        EmailAuthenticationMailer.login_link(login_service.session).deliver

        handle_login_create
      else
        handle_login_failed
      end
    end

  end
end
