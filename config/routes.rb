Rails.application.routes.draw do
  resources :tips, except: [:index, :show, :edit, :update, :delete]

  get '/got-a-tip', to: 'tips#new'

  devise_for :users

  resources :posts do
  	member do
  		put "like", to: "posts#upvote"
  		put "dislike", to: "posts#downvote"
  	end
  end

  root to: "posts#index"

  get 'tags/:tag', to: 'posts#index', as: :tag

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
