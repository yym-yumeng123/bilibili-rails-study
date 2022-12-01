Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    member do
      post :status
    end

    collection do
      get :online
    end
  end
  resources :sessions

  namespace :admin do
    root 'users#index'
    resources :users do
      get :search, on: :collection
    end
  end

  # scope module: 'admin' do
  #   resources :articles
  # end

  # namespace :admin do
  #   resources :xxx
  # end

  # scope '/admin' do
  #   resources :articles
  # end

  # resources :users do
  #   resources :blogs
  # end
end
