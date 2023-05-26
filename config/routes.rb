Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: "homes#top"
  get "home/about" => "homes#about"

  get '/search', to: 'searches#search'

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy,] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  # 応用課題７C８C９Cここから
  # 私の記述
  # resources :groups, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  # resources :groups, except: [:destroy] #省略形
  # resources :groups do
  #   get "join" => "groups#join"
  #   get "new/mail" => "groups#new_mail"
  #   get "send/mail" => "groups#send_mail"
  # end

  # 模範回答
   resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end
  # 応用課題７C８C９Cここまで

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end