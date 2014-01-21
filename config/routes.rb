SmartShop::Application.routes.draw do

  # You can have the root of your site routed with "root"
  root 'site#index'

  namespace :admin, module: "backend" do
    root 'dashboard#index'

    resources :shops
    resources :addresses
    resources :orders do
      collection do
        post :change_states
      end
    end
    resources :payments
    resources :shipments
    resources :shipping_methods
    resources :shipping_categories
    resources :products do
      collection do
        get :trash
      end
      member do
        put :restore
        get :product_properties
      end
      resources :variants
    end
    resources :prototypes
    resources :properties
    resources :option_types
  end

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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

end
