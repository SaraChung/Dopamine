Rails.application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}
  
  root 'home#index'

  get '/home/about_us' => 'home#about_us'
  get '/home/introduction' => 'home#introduction'
  get '/home/contact_us' => 'home#contact_us'
  get '/home/how_to_use' => 'home#how_to_use'
  get '/home/faq' => 'home#faq'

  resources :blogs
  resources :blog_posts
  resources :comments

  resources :profiles do
    collection do
      get :search_profiles
    end
  end

  resources :messages do
    collection do
      post :send_message
      post :reply
      get :sent_messages
    end
    member do
      get :reply_message
      get :conversation
    end
  end
  
  resources :users do
    member do
      get :profile
    end
    collection do
      get :matches
      get :add_match
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
