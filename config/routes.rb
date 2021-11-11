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
        get :top
        get :confirm
      end
      resources :reviews, only: [:index]
    end
    patch '/withdrawal' => 'customers#withdrawal'
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
