Rails.application.routes.draw do
  get 'welcome/index'

  get '/users' => 'user#index'
  get '/users/:id' => 'user#get'
  post '/users' => 'user#create'
  put '/users/:id' => 'user#update'
  delete '/users' => 'user#delete'
  # put '/' =>


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
