Rails.application.routes.draw do
  resources :people do
    resources :addresses
  end
  devise_for :users
  root to: "people#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
