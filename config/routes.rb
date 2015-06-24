Rails.application.routes.draw do
  root "questions#index"
  resources :users
  resources :questions
end
