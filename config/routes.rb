Rails.application.routes.draw do

  namespace :public do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :customer do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :admin do
    get 'favorites/index'
  end
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
      collection do
        get :search
      end
      resources :reviews
      resources :items
      resources :news
      resources :services
      resource :favorites, only: [:create, :destroy]
    end
    resources :customers do
      collection do
        get :like
      end
      resources :reviews, only: [:index]
    end
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :shops do
      collection do
        get :top
      end
      resources :news
      resources :items
      resources :services
      resources :top_banners
      resources :reviews
      resource :favorites
    end
    resources :admins
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
