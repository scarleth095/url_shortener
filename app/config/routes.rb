Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: "pages#home" 
    get '/:short_url_key', to: 'pages#url_direct'
    post '/create', to: 'pages#create'
end
