module EmailAuthentication
  class AuthenticationService

    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def session
      @session ||= UserSession.where(login_token: token).where('login_token_valid_until > ?', Time.now).first
    end

    def session_key
      session.id
    end

    def valid?
      session.present?
    end

    def expire_token!
      session.update!(login_token: nil, login_token_valid_until: 1.year.ago)
    end

  end
end
