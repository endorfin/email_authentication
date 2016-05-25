module EmailAuthentication
  module Controller
    module Redirects
      def self.included(base)
        base.hide_action %w(handle_authorized handle_unauthorized handle_token_invalid handle_logged_out handle_login_create handle_login_failed)
      end

      def handle_authorized
        redirect_to main_app.root_url, notice: I18n.t('email_authentication.notice.authorized')
      end

      def handle_unauthorized
        redirect_to main_app.root_url, alert: I18n.t('email_authentication.alert.unauthorized')
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





