Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pt\-BR/ do
    resources :books
    resources :users
    resource :confirmation, only: [:show]
    resource :user_sessions, only: [:new, :create, :destroy]
  end

  get '/:locale' => 'home#index', locale: /en|pt\-BR/
  root 'home#index'
end
