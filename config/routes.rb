Rails.application.routes.draw do

  root 'public/homes#top'
  get 'homes/about' => 'public/homes#about'

  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions',
    :registrations => 'admins/registrations',
  }

  namespace :admin do
    resources :lessons,except: [:delete]
    resources :users,only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :blogs
  end

  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :passwords => 'users/passwords'
  }
  namespace :public do
    resources :posts
    resources :lessons, only: [:index, :show]
    resources :users,only: [:show, :edit, :update]
    resources :blogs,only: [:index, :show]
    resources :orders,only: [:new, :index, :show, :create]do
      collection do
        post 'orders/confirm'
        get 'orders/thanx'
      end
    end
  end

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html