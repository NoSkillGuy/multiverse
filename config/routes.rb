Rails.application.routes.draw do
  resources :people, only: [:create]
  # resources :families
  # resources :universes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :universes, only: [:create] do 
  	resources :families, :controller => "universe_families", only: [:index]
  end

  resources :families, only: [:create] do 
  	member do 
  		get 'have_same_power_across_universes'
  		get 'balance_unbalanced_families'
  	end
  end
  # resources :families, only: [:create] do 
  # 	resources :universes, :controller => "familiy_universes", only: [:index]
  # end
end
