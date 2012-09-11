ProductCatalog::Application.routes.draw do
  resources :items

  resources :diameters

  resources :lengths

  resources :dimensions

  resources :categories

  resources :hash_sizes

  resources :number_sizes

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
