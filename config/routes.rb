Blorgh::Engine.routes.draw do
  root to: "articles#index"

  resources :articles do
    resources :comments
  end

  get '/testing', to: 'articles#testing_controller'
end
