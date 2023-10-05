Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  delete '/users/:user_id/posts/:post_id', to: 'posts#destroy', as: 'delete_post'
  delete '/users/:user_id/posts/:post_id/comments/:comment_id', to: 'comments#destroy', as: 'delete_comment'

end
