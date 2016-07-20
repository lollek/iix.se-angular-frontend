Rails.application.routes.draw do
  resources :books

  scope 'api' do
    resources :notes
  end

  get    'api/login' => 'users#status'
  post   'api/login' => 'users#login'
  delete 'api/login' => 'users#logout'

  root 'application#angular'

  get '*path' => 'application#angular'
end
