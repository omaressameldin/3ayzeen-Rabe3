Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

#group routes
get 'groups/new' =>'groups#new'
post 'groups/create' =>'groups#create'
get 'groups/:id' =>'groups#show'

#activities routes
get 'activities/new' =>'activities#new'
post 'activities/create' =>'activities#create'
get 'activities' =>'activities#index'

   root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  get 'users/hany/:email/:first_name/:last_name/:password/:image/:x_loc/:y_loc/:gender/:available/:phone_number' => 'users#hany'
  get 'users/new' =>'users#new'
  get 'users/create' =>'users#create'
  get 'users/:id' =>'users#show'
  resources :users
  
  get 'friendships/create/:user_id/:receiver_id' =>'friendships#create'
  get 'friendships/destroy/:user_id/:receiver_id' =>'friendships#destroy'
  get 'users/index/:user_id' =>'users#index'
  get 'users/friends/:user_id' =>'users#friends'
  resources :friendships

  get 'posts/new' =>'posts#new'
  get 'posts/create/:user_id/:receiver_id/:content' =>'posts#create'
  get 'posts/:id' =>'posts#show'
  get 'posts?id=:id' =>'posts#show'
   resources :posts

  get 'comments/new' =>'comments#new'
  get 'comments/create/:user_id/:post_id/:content' =>'comments#create'
  get 'comments/:id' =>'comments#show'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
