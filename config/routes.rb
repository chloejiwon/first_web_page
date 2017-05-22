Rails.application.routes.draw do
  devise_for :users
  post 'posts/:post_id/comments/create' => 'comments#create', as: 'comment_create'
  get 'posts/:post_id/comments/destroy/:id' => 'comments#destroy', as: 'comment_destroy'

  get 'posts' => 'posts#index'
  post 'posts/create/:id' => 'posts#create' , as: 'post_create'
  get 'posts/destroy/:id' => 'posts#destroy' ,as: 'post_destroy'

  post 'posts/find' => 'posts#find', as: 'post_find'
  
  root 'posts#index'

  resources :posts do
    resources :comments
  end
  
  get 'posts/edit/:id' => 'posts#edit', as: 'post_edit'
  post 'posts/update/:id' => 'posts#update', as: 'post_update'
  
  get 'posts/mypost/:id' => 'posts#mypost', as: 'post_mypost'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
