module EmailAuthentication
  class LoginService

    attr_accessor :email, :signup_enabled

    def initialize(email, signup_enabled)
      @email = email
      @signup_enabled = signup_enabled
    end

    def session
      @session ||= @signup_enabled ? login_with_signup : login_only
    end

    def successful?
      session.present? && session.valid?
    end

    def renew_token!(duration=15.minutes)
      session.update!(login_token: SecureRandom.urlsafe_base64,
                      login_token_valid_until: Time.now + duration)
    end

    private

    def login_only
      UserSession.find_by(email: email)
    end

    def login_with_signup
      UserSession.find_or_create_by!(email: email) rescue nil
    end

  end
end
