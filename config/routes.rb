Holoteca::Application.routes.draw do

  scope '/admin' do
    devise_for :users,
      controllers: { registrations: 'admin/registrations', sessions: 'admin/sessions', passwords: 'admin/passwords' }
  end

  namespace :admin do
    root to: 'dashboard#index'
    resources :archives, only: [ :index, :create ]
    resources :categories, only: [ :index, :create ]
    resources :articles
    resources :books do
      get :chapter, on: :member
    end
  end

  get 'privacidade', to: 'statics#privacy', as: :privacy

  get '/uploads/archives/:id/:filename', to: 'archives#image'
  get '/tag/:id',    to: 'holo#tag',      as: :tag
  get '/autor/:id',  to: 'holo#author',   as: :author
  get '/categoria/:id',  to: 'holo#category', as: :category
  get '/seriado/:id',  to: 'holo#serie',    as: :book
  get ':article_id', to: 'holo#article',  as: :article

  root to: 'holo#index'
end
