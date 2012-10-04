ProductCatalog::Application.routes.draw do
  resources :raw_products

  resources :units do
    member do
      get :enter
    end
  end

  resources :products

  resources :items do
    member do
      get :enter
    end
  end

  resources :categories

  authenticated :user do
    root :to => 'items#index'
  end

  match '/skus', :to => 'skus#index'
  root :to => "home#index"

  devise_for :users

  resources :users, :only => [:show, :index]
end
