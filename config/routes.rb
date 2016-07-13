Rails.application.routes.draw do
    root 'projects#index'
	resources :sessions
	resources :users do
		resources :pledges, only: [:show]
	end
    resources :projects do
      resources :rewards
    end
	get 'login' => 'sessions#new', :as => :login
	post 'logout' => 'sessions#destroy', :as => :logout

end
