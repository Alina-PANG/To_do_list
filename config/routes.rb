Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    resources :lists do
      resources :tasks
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
