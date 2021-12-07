Rails.application.routes.draw do
  get 'reports/proposals'
  get 'reports/estimates'
  get 'reports/invoices'
  devise_for :admin_users
  resources :leads do
    member do 
      get :contact
      get :call
      get :appointment
      get :note
      get :proposal
    end
  end
  post '/lead/:lead_id/contact/', to: 'contacts#create', as: 'new_lead_contact'
  get '/lead/:lead_id/contact/:id', to: 'leads#edit_contact', as: 'edit_lead_contact'
  patch '/lead/:lead_id/contact/:id', to: 'contacts#update', as: 'update_lead_contact'
  delete '/lead/:lead_id/contacts/:id', to: 'contacts#destroy', as: 'destroy_contact'

  resources :customers
  resources :products
  resources :taxes
  resources :invoices
  resources :estimates
  resources :proposals
  resources :categories
  resources :staffs
  resources :contacts

  devise_for :accounts
  root to: 'home#index'
end
