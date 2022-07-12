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
  get 'homes/about'
  namespace :public do
    resources :customers, only: [:show, :edit, :update] do
      collection do
      patch :withdraw
      end
    end
    resources :relationships, only: [:destroy, :create]

    resources :posts, only: [:new, :index, :edit, :update, :create, :destroy]
    resources :comments, only: [:create]

  end

  root to: 'homes#top'
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
