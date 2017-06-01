Rails.application.routes.draw do

	root 'static_pages#home'

	get 'about' => 'static_pages#about'
	get 'privacy' => 'static_pages#privacy'
	get 'terms' => 'static_pages#terms'
	get 'donate' => 'static_pages#donate'

	resources :posts, controller: 'posts/posts'
	resources :products, controller: 'products/products'

	resources :users, only: [:show], controller: 'users/users' do
		resource :profile, controller: 'users/profiles', only: [:edit, :update]
	end

	devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations",  unlocks: "users/unlocks"}

  devise_scope :user do
    get "sign_out", to: "users/sessions#destroy"
    get "sign_in", to: "users/sessions#new"
    get "register", to: "users/registrations#new"
  end

end
