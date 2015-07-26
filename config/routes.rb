Holoteca::Application.routes.draw do
  match "/404" => "errors#error_404", via: [ :get, :post, :patch, :delete ], as: :error_404

  scope '/admin' do
    devise_for :users,
      controllers: {
        registrations: 'admin/registrations',
        sessions: 'admin/sessions',
        passwords: 'admin/passwords'
      }
  end

  namespace :admin do
    root to: 'dashboard#index'
    get '/clean', to: "dashboard#clear_cache"
    resources :archives, only: [ :index, :create ]
    resources :categories, only: [ :index, :create, :edit, :update ]
    resources :subscribers
    resources :articles
  end

  get 'privacidade', to: 'statics#privacy', as: :privacy
  get 'anuncie', to: 'statics#contact', as: :contact
  post 'assine', to: 'statics#subscribe', as: :subscribe

  get '/uploads/archives/:id/:filename', to: 'archives#image'
  get '/tag/:id',    to: 'holo#tag',      as: :tag
  get '/autor/:id',  to: 'holo#author',   as: :author
  get '/holos/:id',  to: 'holo#category', as: :category
  get ':article_id', to: 'holo#article',  as: :article

  root to: 'holo#index'
end
