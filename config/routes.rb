Rails.application.routes.draw do
  resources :contents
  resources :courses
  resources :users
  root 'welcome#index'
  get 'welcome/index'
  match ':controller(/:action(/:id))', :via => :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
