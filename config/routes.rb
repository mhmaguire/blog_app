BlogApp::Application.routes.draw do
  get "blog/index"

  devise_for :users, skip: :registrations

  root to: 'blogs#index'
  resource :blog, only: [:edit, :update] do 
  	get 'page/:page', action: :index, on: :collection
  end
  resources :posts do 
    resources :comments, only: [:create]
  end
end
