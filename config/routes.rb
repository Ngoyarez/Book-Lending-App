Rails.application.routes.draw do
  root 'books#index'
  
  resources :books do
    member do
      post 'borrow'
      post 'return'
    end
  end
  
  resources :borrowers, only: [:index, :show]
end