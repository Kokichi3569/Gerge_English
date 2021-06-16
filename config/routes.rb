Rails.application.routes.draw do

  root 'public/homes#top'
  get 'homes/about' => 'public/homes#about'

  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions',
    :registrations => 'admins/registrations',
  }

  namespace :admin do
    get 'blogs/index'
    get 'blogs/show'
    get 'blogs/edit'
    get 'blogs/update'
    get 'blogs/new'
    get 'blogs/create'
  end
  namespace :admin do
    resources :genres, only: [:index, :edit, :create]
  end
  namespace :admin do
    resources :lessons,except: [:delete]

  end
  namespace :admin do
    resources :users,only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :orders, only: [:index, :show, :update]
  end

  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :passwords => 'users/passwords'
  }
  namespace :public do
    get 'posts/new'
    get 'posts/create'
    get 'posts/destroy'
    get 'posts/edit'
    get 'posts/update'
  end
  namespace :public do
    get 'blogs/index'
  end
  namespace :public do
    resources :orders,only: [:new, :index, :show, :create] do
      collection do
        post 'orders/confirm'
        get 'orders/thanx'
      end
    end
  end
  namespace :public do
    resources :lesson, only: [:index, :show]
  end

  namespace :public do
    resources :users,only: [:show, :edit, :update]
  end

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html