Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    resources :customers, only: [:index, :edit, :update, :show]
    resources :posts, only: [:index, :show]
    resources :categories, only: [:index, :edit, :update, :create]
  end


  namespace :public do
    get 'customers/confirm'
    resources :customers, only: [:show, :edit, :update] do
      resource :relationships, only: [:destroy, :create]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      collection do
      patch :withdraw
      end
    end

    resources :posts, only: [:show, :new, :index, :edit, :update, :create, :destroy]do
      resources :comments,only: [:create, :destroy]
    end
  end


  root to: 'homes#top'
  get 'homes/about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
