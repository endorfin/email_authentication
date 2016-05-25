module EmailAuthentication
  module Controller
    module Helpers
      def self.included(base)
        base.hide_action %w(authenticate! current_session signed_in? login_with_signup?)
        base.helper_method %w(current_session signed_in?)
      end

      def authenticate!
        if current_session.nil?
          handle_unauthorized
        end
      end

      def current_session
        @current_session ||= UserSession.find(session[::EmailAuthentication::SESSION_KEY]) if session[::EmailAuthentication::SESSION_KEY]
      end

      def signed_in?
        current_session.present?
      end

      def login_with_signup?
        true
      end
    end
  end
end
