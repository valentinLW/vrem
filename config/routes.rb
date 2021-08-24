Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, only: %i[new create index show edit update] do
    resources :messages, only: :create
    resources :invitations, only: %i[create index]
  end

end
