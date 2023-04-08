Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"

  # 検索機能
  # get "search" => "searches#search"
  get '/search', to: 'searches#search'

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy,] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    # 応用課題９B・ユーザーの詳細ページに検索欄を表示させたいので、ネストさせる・ここから
    # get 'search', to: 'users#search'#私の記述
    # 応用課題９B・ここまで
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end