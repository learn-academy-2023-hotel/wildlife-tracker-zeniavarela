Rails.application.routes.draw do
  resources :animals do
    member do
      get 'sightings', to: 'sightings#animal_sightings'
    end
  end

  resources :sightings, only: [:index, :show, :create, :destroy, :update]
  
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
