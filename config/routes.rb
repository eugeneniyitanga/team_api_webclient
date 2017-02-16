Rails.application.routes.draw do
  
 post "/teams", to:'teams#create'
 get "/teams", to: 'teams#index'
 get "/teams/new", to: 'teams#new'
 get "/teams/:id", to: 'teams#show'
 get "/teams/:id/edit", to: 'teams#edit'
 patch "/teams/:id", to: 'teams#update'
 delete "/teams/:id", to: 'teams#destroy'


end
