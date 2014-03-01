Octodata::Application.routes.draw do
  get '/auth/github', as: 'github_auth'
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :repositories

  root to: 'repositories#index'
end
