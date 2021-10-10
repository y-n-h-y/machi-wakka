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
    resources :shops do
      resources :reviews
      resources :items
      resources :news
      resources :services
    end
    resources :customers
  end

  namespace :admin do
    get '/' => 'homes#top'
    get '/shop/top' => 'shops#top'
    resources :shops do
      resources :news
      resources :items
      resources :services
      resources :top_banners
      resources :reviews
    end
    resources :configurations
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
