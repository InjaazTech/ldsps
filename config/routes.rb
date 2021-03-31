Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "website#index"
  scope '/:locale', locale: /ar|en/, defaults: {locale: 'en'} do
    get '/', to: 'website#index'
    get 'contact-us', to: 'website#contact'
    post :send_contact, to: 'website#send_contact'
    get :about, to: 'website#about'
    resources :projects, :reports, :albums, param: :slug, only: [:index, :show]
    get :search, to: 'website#search'
    get :team, to: 'website#team'
  end
  get :admin, to: redirect('/admin/website_configs')
  namespace :admin do
    get :index, to: 'main#index'
    get :account, to: 'users#account'
    put :update_account, to: 'users#update_account'
    resources :website_configs, only: [:index, :edit, :update]
    resources :wpages
    resources :sliders
    resources :attachments, only: [:create, :destroy]
    resources :posts
    resources :contact_users, only: [:index, :destroy]
    resources :fa_questions
    resources :suppliers
    resources :clients, :testimonials, :team_members, :users
  end
  # match "*path", to: "website#not_found", via: :all
end
