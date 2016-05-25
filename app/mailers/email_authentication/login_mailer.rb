module EmailAuthentication
  class LoginMailer < ApplicationMailer
    def login_link(user_session)
      @user_session = user_session

      mail to: @user_session.email, subject: I18n.t('email_authentication.mailer.subject')
    end
  end
end
