Rails.application.routes.draw do

  get 'projects/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'spaces#home'
  get 'view/:item/:id', to: 'spaces#home', as: :item_view

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  get 'posts/relevant', to: 'posts#relevant'
  get 'posts/edit', to: 'posts#edit'
  
  get 'projects/tagged/:tag', to: 'projects#tagged'

  get 'users/edit', to: 'users#edit'
  get 'users/allnames', to: 'users#allnames'
  get 'users/:id/popup', to: 'users#popup'

  resources :projects do 
    member do
      post 'follow'
      get 'main_display'
      get 'description'
      get 'posts'
      get 'following'
    end
  end
  resources :users
  resources :comments
  resources :posts do
    member do
      get 'preview'
    end
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
