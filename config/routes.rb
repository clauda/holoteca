Holoteca::Application.routes.draw do

  scope '/admin' do
    devise_for :users,
      controllers: { registrations: 'admin/registrations', sessions: 'admin/sessions', passwords: 'admin/passwords' }
  end

  namespace :admin do
    root to: 'dashboard#index'
    resources :categories, only: [ :index, :create ]
    resources :articles
  end

  resources :articles, path: '', only: [ :show ]
  root to: 'holo#index'
end
