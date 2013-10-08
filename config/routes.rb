Estator::Application.routes.draw do

  root to: 'pages#home'

  resources :properties, only: [:index, :show, :new, :create] do
    collection do
      get :rentals
      get :for_sale
      get :recent
      get :houses
      get :condos
      get :apartments
    end
  end

  namespace :admin do
    resources :properties, except: :show
  end
end
