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
  end

  get '/uploads/archives/:id/:filename', to: 'archives#image'
  get '/tag/:id',    to: 'holo#tag',      as: :tag
  get '/autor/:id',  to: 'holo#author',   as: :author
  get '/holos/:id',  to: 'holo#category', as: :category
  get ':article_id', to: 'holo#article',  as: :article

  root to: 'holo#index'
end
