Rails.application.routes.draw do
  get 'doses/new'

  get 'cocktails/new'

  get 'cocktails/index'

  root 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
