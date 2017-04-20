Rails.application.routes.draw do
  root to: redirect('/members')
  get '/members', to: "members#index"
  
  resources :members, only: [:index, :edit, :create, :update]
  resources :transactions, only: [:create]

  get 'members/create', to: 'members#new'
  get 'transactions/create', to: 'transactions#new'
end
