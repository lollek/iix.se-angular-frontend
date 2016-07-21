Rails.application.routes.draw do
  resources :books

  scope 'api' do
    resources :notes

    get    'login' => 'users#status'
    post   'login' => 'users#login'
    delete 'login' => 'users#logout'
  end


  root 'application#angular'

  get '*path' => 'application#angular'
end
