Rails.application.routes.draw do

    devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

    devise_for :admin, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  scope module: :public do
    root to: "homes#top"
    resources :reviews
    resources :items
    resources :news
    resources :services
    resources :shops
    resources :customers
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :news
    resources :items
    resources :services
    resources :top_banners
    resources :shops
    resources :reviews
    resources :configurations
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
