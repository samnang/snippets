Rails.application.routes.draw do
  root to: 'snippets#index'
  resources :snippets, only: [:show, :new, :create]
end
