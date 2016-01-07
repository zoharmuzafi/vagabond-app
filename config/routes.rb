Rails.application.routes.draw do

  get "site/index"

  root to: "site#index"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: [:index]

  ##nesting the resource here to create the post and comments directly in the city show page
  
  resources :cities, only: [:show] do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end
 
  # delete "/destroy_comments", to: "comments#destroy"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "auth/:provider/callback", to: "sessions#createWithFacebook"
end

#             Prefix Verb   URI Pattern                                            Controller#Action
#         site_index GET    /site/index(.:format)                                  site#index
#               root GET    /                                                      site#index
#           sessions POST   /sessions(.:format)                                    sessions#create
#        new_session GET    /sessions/new(.:format)                                sessions#new
#            session DELETE /sessions/:id(.:format)                                sessions#destroy
#              users POST   /users(.:format)                                       users#create
#           new_user GET    /users/new(.:format)                                   users#new
#          edit_user GET    /users/:id/edit(.:format)                              users#edit
#               user GET    /users/:id(.:format)                                   users#show
#                    PATCH  /users/:id(.:format)                                   users#update
#                    PUT    /users/:id(.:format)                                   users#update
#                    DELETE /users/:id(.:format)                                   users#destroy
# city_post_comments POST   /cities/:city_id/posts/:post_id/comments(.:format)     comments#create
#  city_post_comment DELETE /cities/:city_id/posts/:post_id/comments/:id(.:format) comments#destroy
#         city_posts POST   /cities/:city_id/posts(.:format)                       posts#create
#      new_city_post GET    /cities/:city_id/posts/new(.:format)                   posts#new
#     edit_city_post GET    /cities/:city_id/posts/:id/edit(.:format)              posts#edit
#          city_post GET    /cities/:city_id/posts/:id(.:format)                   posts#show
#                    PATCH  /cities/:city_id/posts/:id(.:format)                   posts#update
#                    PUT    /cities/:city_id/posts/:id(.:format)                   posts#update
#                    DELETE /cities/:city_id/posts/:id(.:format)                   posts#destroy
#               city GET    /cities/:id(.:format)                                  cities#show
#             signup GET    /signup(.:format)                                      users#new
#                    POST   /users(.:format)                                       users#create
#              login GET    /login(.:format)                                       sessions#new
#                    POST   /login(.:format)                                       sessions#create
#             logout GET    /logout(.:format)                                      sessions#destroy
#                    GET    /auth/:provider/callback(.:format)                     sessions#createWithFacebook