Rails.application.routes.draw do
  delete 'subject/:id', to: 'subject#delete'
  get 'subjects', to: 'subject#list'
  post 'subject', to: 'subject#create'
  put 'subject', to: 'subject#update'
  get 'user/auto_login'
  get 'users', to: 'user#list'
  post 'user/login'
  post 'user/register'
end
