Rails.application.routes.draw do

  resources :courses do
  	member	do
  		get :enroll
      get :manage_tutor
      get :assign_tutor
      get :apply_for_tutor
      get :remove_tutor
      get :remove_request
      get :communicate
  	end
  	resources :contents, :except => [:show]
    resources :posts do
      resources :comments
    end
  end

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/dashboard' =>'pages#dashboard'
  get 'pages/dashboard'
  get '/index' => 'pages#index'
  get 'pages/index'
  get 'pages/about'
  get '/about' =>'pages#about'
  get '/' => 'pages#index'
  get '/vdl' => 'pages#vdl'

  root 'pages#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end