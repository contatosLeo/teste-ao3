Rails.application.routes.draw do
  root to: "vehicles#index"
  devise_for :users
  resources :vehicles
  resources :reserves, only: [:index, :new, :create, :show]

  # get   'reserves/reserve/:vehicle_id',  to: 'reserve#reserve', as: 'reserves_reserve'
  # get   'reserves/my_reserve/:document', to: 'reserve#index', as: 'reserves_my_reserve'
  # post  'reserves/reserve/:vehicle_id',  to: 'reserve#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
