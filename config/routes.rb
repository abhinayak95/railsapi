Rails.application.routes.draw do
  get 'welcome/index'

  get '/users/:id' => 'user#get'
  get '/users' => 'user#get_by_phone_num'
  post '/users/new' => 'user#create'
  delete '/users' => 'user#delete'
  # put '/' =>


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
