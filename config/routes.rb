Rails.application.routes.draw do
	devise_for :users

	root 'home#index'
  
	get 'news', to: 'news#index', defaults: {format: :json}
	get 'news/:id', to: 'news#show', defaults: {format: :json}
end
