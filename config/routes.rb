Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events, only: %i[new create index show edit update] do
    resources :messages, only: :create
    resources :invitations, only: %i[create index]
    post "invite/:user_id", to: 'invitations#create', as: :invite
  end

  patch "invitations/:id/accept", to: 'invitations#accept', as: :accept
  patch "invitations/:id/reject", to: 'invitations#reject', as: :reject
end
