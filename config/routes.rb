Rails.application.routes.draw do

  namespace :admin do
  get 'dashboard/index'
  resources :products , except: [:show , :index]  
  resources :accessories 
  end
  resources :looks
  get '/products' => "products#index"
  get '/products/:id/show' => "products#show" , as: 'products_show'
  root 'dashboard#index' 

  devise_for :users
  resources :users
  resources :events
  get '/myaccount' => "users#myaccount"
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
