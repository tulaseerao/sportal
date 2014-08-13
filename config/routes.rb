Sportal::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'login', to: 'users#sign_in'
  get 'logout', to: 'users#sign_out'
  get 'stud_data', to: 'welcome#stud_data'
  get 'dept_data', to: 'welcome#dept_data'
  get 'rec_course_data', to: 'welcome#rec_course_data'
  get 'curr_course_data', to: 'welcome#curr_course_data'
  get 'store_course', to: 'welcome#store_course'
  get 'dept_grade_courses_data', to: 'welcome#dept_grade_courses_data'
  get 'get_courses', to: 'welcome#get_courses'
  get 'electives', to: 'welcome#electives'
  get 'summary', to: 'welcome#summary'
  
  # -------------------------------------------------------------------
    # Admin Routes
    # -------------------------------------------------------------------
     
  
    get '/admin', to: "admin/accounts#index", as: "admin"
    get "/admin/accounts/:action", controller: "admin/accounts"
    
 namespace :admin do
    resources :accounts
    resources :grades
      
    resources :departments
      
    resources :courses
      
     resources :students
     resources :teachers
     resources :admins
  end
  
  resources :departments
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
