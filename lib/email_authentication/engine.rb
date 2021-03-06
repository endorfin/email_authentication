module EmailAuthentication
  class Engine < ::Rails::Engine
    isolate_namespace EmailAuthentication
    engine_name 'email_authentication'

    initializer  "load_helpers" do
      ActionController::Base.send :include, ::EmailAuthentication::Controller::Helpers
      ActionController::Base.send :include, ::EmailAuthentication::Controller::Redirects
    end
  end
end
