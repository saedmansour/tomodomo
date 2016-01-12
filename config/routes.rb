Rails.application.routes.draw do
	devise_for :users

	root 'home#index'
  
	get 'news', to: 'news#index', defaults: {format: :json}
end
