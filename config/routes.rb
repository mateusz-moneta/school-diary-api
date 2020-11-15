Rails.application.routes.draw do
  resource :class_room, :class_unit, :lesson_hour, :lesson_plan, :subject

  get 'user/auto_login'
  get 'user', to: 'users#list'
  post 'user/login', to: 'users#login'
  post 'user/register', to: 'users#register'
end
