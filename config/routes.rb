Rails.application.routes.draw do
  root "questions#index"
  resources :users do
    resources :questions, only: [:index, :show]
  end

  resources :answers, only: [:new, :create]
  resources :questions do
    resources :answers, only: [:index]
  end
end
