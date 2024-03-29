EdAlbum::Application.routes.draw do
match 'exit' => 'home#logout', :as => :logout
match 'delete_album/:id' => 'albums#destroy', :as => :delete_album
match '/albums/:album_id/photos/:photo_id/comments' => 'comments#create', :as => :new_comment
match '/albums/:album_id/delete_photos/:id' => 'photos#destroy', :as => :delete_photo
match '/delete_users/:id' => 'users#destroy', :as=> :delete_user
  resources :albums do
    resources :photos do
      resources :comments
    collection do
      get 'all_album_photos'
    end
    member do
      get  'download'
      get 'set_cover_photo'
    end
    end
   collection do
     get 'my_albums'
     get 'add_photo'
     get 'all_albums'
   end
  end
	
	resources :likes do
	collection do
  get 'photo_like'
	get 'photo_unlike'	
  end
	member do
	get 'album_like'
	get 'album_unlike'
  get 'all_album_like'
	get 'all_album_unlike'
	get 'comment_like'
	get 'comment_unlike'
  get 'solution_like'
  get 'solution_unlike'
	end
	end
  resources :users do
    collection do
     post 'modify_password'
     get 'admin'
     get 'employee'
     get 'change_password'
   end
  end

  resources :home do
    collection do 
      post 'check_login'
      delete 'logout'
      get 'login'
      get 'home_page'
    end
  end

  resources :emailer do
    collection do
     get 'mail'
     get 'new_email' 
     post 'sendmail'
     get 'admin'
     post 'employee_email'
   end
  end
 

  resources :problems do
     get 'new'
  end

	resources :solutions do
     collection do
     	get 'search_solutions'
     	get 'create_solution'
     	post 'solutions' 
     	get 'search'
     end
     member do
     get 'verify'
     get 'reject'
     end
  end
	
	resources :suggestions do
		collection do
    	 get 'event'
    	 get 'create_event'
     end
  end
  


  root :to => 'home#home_page'

  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
