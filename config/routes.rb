Rails.application.routes.draw do
  get 'user/list'
  post 'user/login'
  post 'user/register'
end
