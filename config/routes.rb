Rails.application.routes.draw do

  scope 'api' do
    resources :notes
    resources :books

    get    'login' => 'users#status'
    post   'login' => 'users#login'
    delete 'login' => 'users#logout'
  end

  root 'application#angular'

  get '*path' => 'application#angular'
end
