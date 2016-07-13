Rails.application.routes.draw do
	root :to => 'users#index'
	resources :sessions
	resources :users do
		resources :pledges, only: [:show]
	end
	resources :projects
	resources :rewards

	get 'login' => 'sessions#new', :as => :login
	post 'logout' => 'sessions#destroy', :as => :logout

end
