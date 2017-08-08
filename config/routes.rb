Rails.application.routes.draw do
    root 'welcome#home'
    get "/signin", to: "session#new"
    post "/signin", to: "session#create"
    delete "/signout", to: "session#destroy"
    get "/signup", to: "users#new"
    get '/auth/facebook/callback', to: 'session#create'
    
    resources :users, only: [:show]
    resources :songs, :setlists, :groups
    namespace :admin do
        resources :users 
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
