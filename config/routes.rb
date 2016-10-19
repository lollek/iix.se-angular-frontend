Rails.application.routes.draw do
  root 'application#angular'

  scope 'api' do
    resources :notes, only: [:index, :show, :create, :update, :destroy]
    resources :books, only: [:index, :show, :create, :update, :destroy]
    resources :beers, only: [:index, :show, :create, :update, :destroy]
    resources :markdown, only: [:show, :update]

    get    'login' => 'users#status'
    post   'login' => 'users#login'
    delete 'login' => 'users#logout'
  end

  get '*path' => 'application#angular'
end
