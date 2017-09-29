Rails.application.routes.draw do
  
  get 'estacionamiento/nuevo_est'
  
  post 'estacionamiento/nuevo_est_post'

  get 'estacionamiento/buscar_est'
  
  get 'estacionamiento/buscar_est_get'

  get 'productos/nuevo'
  
  post 'productos/nuevo_post'
  
  get 'productos/buscar'

  get 'productos/buscar_get'
  
  get 'tarea2/calcular'
  
  post 'tarea2/calcular_post'

  get 'tarea2/rando'
  
  post 'tarea2/rando_post'

  get 'test/tab1'

  post 'test/tab1_post'
  
  get 'test/tab2'

  post 'test/tab2_post'
  
  get 'test/tab3'
  
  post 'test/tab3_post'

  get 'test/tab4'

  post 'test/tab4_post'

  get 'test/tab5'

  get 'dashboard/index'
  
  get 'dashboard/persona'
  
  post 'dashboard/persona_post'

  get 'dashboard/local'

  get 'dashboard/canchita'

  get 'dashboard/alquiler'

  get 'dashboard/servicioadicional'

  get 'dashboard/listaalquiler'

  get 'dashboard/publicidad'

  get 'dashboard/acceso'

  get 'pagredsocial/fotoscanchita'

  get 'pagredsocial/caracteristica'

  get 'pagredsocial/integrante'

  get 'pagredsocial/miembro'

  get 'pagredsocial/contactenos'

  get 'redsocial/index'

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
