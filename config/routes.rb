Rails.application.routes.draw do
  scope 'configuration' do
    resources :assignments
    resources :class_rooms
    resources :class_units
    resources :lesson_hours
    resources :lesson_plans
    resources :subjects
  end

  scope 'user' do
    resource :registration, only: [:create]
    resource :session, only: [:create, :destroy]
  end

  resources :translations, only: [:index]
  resources :users, only: [:index, :show]
end
