ImageHoster::Application.routes.draw do

	#encoding: utf-8
	scope "(:locale)", :locale => /en|de/ do

		get "start/index"
		root :to => "start#index"
		devise_for :users, :controllers => {:registrations => "registrations"}

		resources :user
    post "user/show"

    resources :friends
    get "friend/search"
    get "friend/showrequest"
    get "friend/showfriends"
    get "friend/show_own_requests"
    put "friend/delete_friendship"
    post "friend/search"
    post "friend/send_friendship_request"
    put "friend/send_friendship_request"
    post "friend/accept_friendship_request"
    put "friend/accept_friendship_request"
    put "friend/delete_friendship_request"
    put "friend/reject_friendship_request"

    resources :messages
    post "messages/create_answer"
    post "messages/create_conversation"
    post "messages/add_user"
    post "messages/delete_user"

    resources :file_uploads
    resources :images
    get "images/show", :to => "images#addComment"
    get "images/addComment", :to => "images#addComment"
    post "images/addComment", :to => "images#addComment"

    resources :projects
	end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
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
  # match ':controller(/:action(/:id))(.:format)'
end
