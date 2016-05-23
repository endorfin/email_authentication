EmailAuthentication::Engine.routes.draw do
  post 'login' => 'logins#create', as: 'login'
  get 'auth/:token' => 'sessions#create', as: 'authentication'
  delete 'logout' => 'sessions#destroy', as: 'logout'
end
