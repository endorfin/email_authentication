Rails.application.routes.draw do

  mount EmailAuthentication::Engine => "/email_authentication"
end
