Rails.application.routes.draw do
  get 'events/new'

  get 'events/index'

  get 'events/create'

  get 'events/update'

  get 'events/edit'

  get 'events/show'

  get 'events/destroy'

  get 'registration/new'

  get 'registration/index'

  get 'registration/create'

  get 'registration/edit'

  get 'registration/destroy'

  get 'registration/show'

  get 'registration/update'

  get 'employee/index'

  get 'employee/new'

  get 'employee/create'

  get 'employee/update'

  get 'employee/edit'

  get 'employee/show'

  get 'employee/destroy'

  get 'clients/index'

  get 'clients/new'

  get 'clients/create'

  get 'clients/update'

  get 'clients/show'

  get 'clients/destroy'

  get 'clients/edit'

  get 'users/index'

  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/edit'

  get 'users/destroy'

  get 'users/show'

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
