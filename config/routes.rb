Rails.application.routes.draw do
  get 'upload/new'
  get 'upload/create'
  devise_for :users
  root to: 'pages#home'

  resources :events, only: %i[new create index show edit update] do
    resources :uploads, only: %i[new create]
    resources :messages, only: %i[create]
    resources :invitations, only: %i[create index]
    get "messages", to: 'messages#show', as: :chat
    post "invite/:user_id", to: 'invitations#create', as: :invite
  end

  patch "invitations/:id/accept", to: 'invitations#accept', as: :accept
  patch "invitations/:id/reject", to: 'invitations#reject', as: :reject
end
