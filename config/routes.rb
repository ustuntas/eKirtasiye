Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  root "home#index"
  
  resources :categories, only: [:index, :show] do
    resources :products, only: [:index], module: :categories
  end
  
  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create, :destroy], module: :products
    member do
      post :add_to_cart
      post :add_to_favorites
    end
  end
  
  get "/search", to: "search#index"
  
  resource :cart, only: [:show, :update, :destroy] do
    member do
      post :add_item
      delete :remove_item
      patch :update_item
      post :apply_coupon
      post :apply_points
    end
  end
  
  resources :checkout, only: [:index, :create] do
    collection do
      get :address
      post :save_address
      get :payment
      post :process_payment
      get :confirmation
    end
  end
  
  resources :orders, only: [:index, :show] do
    member do
      post :cancel
      post :request_refund
    end
  end
  
  resources :schools, only: [:index, :show] do
    member do
      get :classes
      get :class_list
      post :add_class_list_to_cart
    end
  end
  
  resources :favorites, only: [:index, :destroy]
  
  namespace :account do
    root to: "dashboard#index"
    resources :orders, only: [:index, :show]
    resources :addresses
    resources :reviews
    resources :favorites, only: [:index, :destroy]
    resource :profile, only: [:show, :edit, :update]
  end

  namespace :school do
    root to: "dashboard#index"
    resources :class_lists do
      member do
        post :publish
        post :unpublish
        get :versions
      end
    end
    resources :products, only: [:index, :show], module: :class_lists
    resource :profile, only: [:show, :edit, :update]
    resources :point_transactions, only: [:index]
    resource :school_point, only: [:show]
  end

  namespace :admin do
    root to: "dashboard#index"
    
    resources :products do
      resources :product_images, except: [:show]
    end
    resources :categories
    
    resources :orders, only: [:index, :show, :update] do
      member do
        post :approve
        post :ship
        post :deliver
        post :cancel
      end
    end
    
    resources :users do
      member do
        post :change_role
        post :toggle_active
      end
    end
    
    resources :schools do
      member do
        post :approve
        post :reject
      end
    end
    resources :school_accounts, only: [:index, :show, :update] do
      member do
        post :approve
        post :reject
      end
    end
    
    resources :coupon_codes
    
    get "/reports", to: "reports#index"
    get "/reports/sales", to: "reports#sales"
    get "/reports/school_points", to: "reports#school_points"
    get "/reports/products", to: "reports#products"
    
    resource :settings, only: [:show, :update]
  end
end