Rails.application.routes.draw do

  root to: "site#index"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: [:index]
  
  resources :cities, only: [:show] do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :update, :destroy]
    end
  end



  get '/signup', to: "users#new"
  post '/users', to: "users#create"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
end

#      Prefix Verb   URI Pattern               Controller#Action
#        root GET    /                         site#index
#    comments POST   /comments(.:format)       comments#create
#     comment PATCH  /comments/:id(.:format)   comments#update
#             PUT    /comments/:id(.:format)   comments#update
#             DELETE /comments/:id(.:format)   comments#destroy
#       posts POST   /posts(.:format)          posts#create
#    new_post GET    /posts/new(.:format)      posts#new
#   edit_post GET    /posts/:id/edit(.:format) posts#edit
#        post GET    /posts/:id(.:format)      posts#show
#             PATCH  /posts/:id(.:format)      posts#update
#             PUT    /posts/:id(.:format)      posts#update
#             DELETE /posts/:id(.:format)      posts#destroy
#    sessions POST   /sessions(.:format)       sessions#create
# new_session GET    /sessions/new(.:format)   sessions#new
#     session DELETE /sessions/:id(.:format)   sessions#destroy
#       users POST   /users(.:format)          users#create
#    new_user GET    /users/new(.:format)      users#new
#   edit_user GET    /users/:id/edit(.:format) users#edit
#        user GET    /users/:id(.:format)      users#show
#             PATCH  /users/:id(.:format)      users#update
#             PUT    /users/:id(.:format)      users#update
#             DELETE /users/:id(.:format)      users#destroy
#        city GET    /cities/:id(.:format)     cities#show
#      signup GET    /signup(.:format)         users#new
#             POST   /users(.:format)          users#create
#       login GET    /login(.:format)          sessions#new
#             POST   /login(.:format)          sessions#create
#      logout GET    /logout(.:format)         sessions#destroy