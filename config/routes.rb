Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create, :confirm]

  get 'about' => 'welcome#about'
  # get 'users/confirm'
  post 'users/confirm' => 'users#confirm'
  root to: 'welcome#index'
end
