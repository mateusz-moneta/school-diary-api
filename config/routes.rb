Rails.application.routes.draw do
  get 'subjects', to: 'subject#list'
  delete 'subject/:id', to: 'subject#delete'
  post 'subject', to: 'subject#create'
  put 'subject', to: 'subject#update'
  get 'user/auto_login'
  get 'user/list'
  post 'user/login'
  post 'user/login'
  post 'user/register'
end
