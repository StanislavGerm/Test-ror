Rails.application.routes.draw do
	devise_for :users
	resources  :merchants

  get "/my_merchants" => "merchants#my_merchants"
	devise_scope :user do
		authenticated :user do
			root "merchants#index", as: :authenticated_root
			get "/users/sign_out" => "devise/sessions#destroy"
		end
			unauthenticated do
			root "devise/sessions#new", as: :unauthenticated_root
		end
	end
end

