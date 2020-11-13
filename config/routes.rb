Rails.application.routes.draw do
  get 'user/auto_login'
  get 'user/list'
  post 'user/login'
  post 'user/register'
end
