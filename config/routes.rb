Rails.application.routes.draw do

  root 'page#index'

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

  resource :users, only: [:create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
