Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: %i[new create index]
end
