Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  root 'welcome#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :users do
    resources :lists do
      get '/rank/imp', to: 'tasks#rank_by_imp'
      get '/rank/date', to: 'tasks#rank_by_date'
      get '/rank/status', to: 'tasks#rank_by_status'
      get '/completed', to: 'tasks#completed'

      resources :tasks do
        patch '/markComplete', to: 'tasks#markComplete'
      end

    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
