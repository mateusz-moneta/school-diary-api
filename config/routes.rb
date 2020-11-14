Rails.application.routes.draw do
  resource :class_unit, :subject

  get 'user/auto_login'
  get 'user', to: 'users#list'
  post 'user/login', to: 'users#login'
  post 'user/register', to: 'users#register'
end
