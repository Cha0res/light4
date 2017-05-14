Rails.application.routes.draw do

  root 'page#index'

  get '/page/products' => 'page#products', :as => 'page_products'

  get '/page/product_info' => 'page#product_info', :as => 'page_product_info'

  get '/page/topics' => 'page#topics', :as => 'page_topics'

  get '/page/designers' => 'page#designers', :as => 'page_designers'

  get '/page/designer_info' => 'page#designer_info', :as => 'page_designer_info'

  get '/page/stories' => 'page#stories', :as => 'page_stories'

  # admin后台管理员的路由
  get '/admin' => 'admins#index'

  get '/admin/login' => 'admins#login', :as => 'admin_login'

  get '/admin/welcome' => 'admins#welcome', :as => 'admin_welcome'

  get '/admin/main' => 'admins#main', :as => 'admin_main'

  get '/admin/edit' => 'admins#edit', :as => 'admin_edit'

  post '/admin/create_login_session' => 'admins#create_login_session'

  get '/admin/logout' => 'admins#logout', :as => 'admin_logout'

  resource :admins, only: [:update]

  # 用户的路由
  get '/login' => 'users#login', :as => 'login'

  get '/signup' => 'users#signup', :as => 'signup'

  post '/create_login_session' => 'users#create_login_session'

  get '/logout' => 'users#logout', :as => 'logout'

  resources :users


  # 话题
  resources :topics

  # 评论管理
  resources :comments

  # 产品管理
  resources :products

  # 故事
  resources :stories

  # 設計師
  resources :designers

  # 合作方管理
  resources :partners

  # 圖片上傳
  post '/upload/image' => 'upload#image', :as => 'upload_image'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
