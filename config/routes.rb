Rails.application.routes.draw do
  root "questions#index"
  
  resources :users do
    resources :questions, only: [:index, :new, :create]
  end

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end
  resources :answers, only: [:show]
end
