Rails.application.routes.draw do
  
  root 'questions#index'

  resources :tests do
    resources :questions, shallow: true
  end

  resources :questions
end
