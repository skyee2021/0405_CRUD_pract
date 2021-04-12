Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create] do
    collection do
      get :sign_up, action: 'new'
      # get :sign_in, action: 'new'
      #可以放在同一個裡面。
    end
  end

  resources :sessions, path: 'users', only: [] do
    collection do
      get :sign_in, action: 'new'
      post :sign_in, action: 'create'
    end
  end

  resources :candidates
  root 'candidates#index'

  
  end
