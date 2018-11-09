Rails.application.routes.draw do
  get 'welcome/index'

  get '/users/:phone_num' => 'user#get_by_phone_num'
  post '/users/new' => 'user#create'
  delete '/users' => 'user#delete'
  # put '/' =>

  resources :articles

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
