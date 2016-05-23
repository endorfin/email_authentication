module EmailAuthentication
  module Controller
    module Helpers
      def self.included(base)
        base.hide_action %w(authenticate! current_session signed_in?)
        base.helper_method %w(current_session signed_in?)
      end

      def authenticate!
        if current_session.nil?
          handle_unauthorized
        end
      end

      def current_session
        user_session_id = session[::EmailAuthentication::SESSION_KEY]

        UserSession.find_by_id user_session_id
      end

      def signed_in?
        current_session.present?
      end

      private

      def login_with_signup?
        true
      end

      def handle_authorized
        redirect_to main_app.root_url, notice: I18n.t('email_authentication.notice.authorized')
      end

      def handle_unauthorized
        redirect_to main_app.root_url, notice: I18n.t('email_authentication.alert.unauthorized')
      end

      def handle_token_invalid
        redirect_to main_app.root_url, alert: I18n.t('email_authentication.alert.token_invalid')
      end

      def handle_logged_out
        redirect_to main_app.root_url, notice: I18n.t('email_authentication.notice.logged_out')
      end

      def handle_login_create
        redirect_to main_app.root_url, notice: I18n.t('email_authentication.notice.login_link_sent')
      end

      def handle_login_failed
        redirect_to main_app.root_url, notice: I18n.t('email_authentication.alert.login_failed')
      end
    end
  end
end
