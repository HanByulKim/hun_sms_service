Rails.application.routes.draw do
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :products, only: [:index]

  root 'main#index'
  post '/sendtest' => 'tm#sendtest'
  post '/send' => 'tm#trigger_sms_alerts'
  
  get '/admin' => 'admin#panel'
  get '/admin/prev_list' => 'admin#prev_list'
  get '/admin/session_list' => 'admin#session_list'     
  get '/admin/admin_list' => 'admin#admin_list'
  get '/admin/register' => 'admin#register'
  get '/admin/publicity' => 'admin#publicity'
  get '/admin/publicity_new' => 'admin#publicity_new'
  get '/admin/publicity/history' => 'admin#publicity_history'
  get '/admin/admin_enrollment' => 'admin#admin_enrollment'
  post '/admin/admin_enrollment/create' => 'admin#admin_enrollment_create'
  post '/admin/create' => 'admin#create'
  post '/admin/delete' => 'admin#delete'
  post '/admin/publicity_new/sendtext' => 'admin#sendtext_user'
  get '/admin/video' => 'admin#video'
  post '/admin/video/create' => 'admin#video_create'
  get '/admin/news' => 'admin@news'
  post '/admin/news/create' => 'admin#news_create'
  post '/admin/statistics/member/record' => 'admin#statistics_member_record'
  
  get '/video/index' => 'video#index'
  get '/video/player' => 'video#player'
  post '/video/comment' => 'video#comment'
  get '/news/index' => 'news#newsindex'
  get '/news/article' => 'news#article'
  get '/blog/index' => 'news#blogindex'
  post '/news/comment' => 'news#comment'
  get '/users/invitation' => 'users#invitation'
  post '/users/invitation/sendtext' => 'users#invitation_sendtext'
  
  get '/error' => 'sessions#error'
  
  get '/admin/statistics/member' => 'admin#statistics_member'
  get '/admin/statistics/post' => 'admin#statistics_post'
  
  resources :videos, except: [:show] do
    post "/like", to: "video#like_toggle"
  end
  resources :news, except: [:show] do
    post "/like", to: "news#like_toggle"
  end
  # get '/' => 'tm#index'
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
