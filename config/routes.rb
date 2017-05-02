Rails.application.routes.draw do
  devise_for :users
  resources :posts

  root to: "posts#index"

  get 'tags/:tag', to: 'posts#index', as: :tag

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
