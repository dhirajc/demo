require 'sidekiq/web'

Rails.application.routes.draw do
  
mount Sidekiq::Web => '/sidekiq'

  namespace :admin do
  get 'dashboard/index'
  get 'accessories/order_all'
  resources :products , except: [:show , :index]  
  resources :accessories
  resources :events 
  end
  resources :looks
  # get '/products' => "products#index"
  root 'products#index'
  get '/products/:id/show' => "products#show" , as: 'products_show'
  #root 'dashboard#index' 
  
  devise_for :users
  resources :users do
    resources :orders
  end
  resources :events
  get '/myaccount' => "users#myaccount"
  post '/invite' => "events#invite"

  namespace :api do
    namespace :v1 do
      resources :accessories
    end
  end
  resources :fittings
  resources :carts
  resources :cart_items
  post "checkout" => "checkout#show", as: :checkout
  post "carts/checkout" => "carts#checkout", as: :cart_checkout
  post "payment" => "checkout#create", as: :payment

  post "/payment/processed" => "checkout#create", as: :payment_completed
##### New added for custom error
# unless Rails.env.test?
#   get '404', :to => 'errors#page_not_found'
#   get '422', :to => 'errors#server_error'
#   get '500', :to => 'errors#server_error'
# end
#### custom error end here
  
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
