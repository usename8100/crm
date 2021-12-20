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
      get :invoice
    end
  end

  #contact
  post '/lead/:lead_id/contact/', to: 'contacts#create', as: 'new_lead_contact'
  get '/lead/:lead_id/contact/:id', to: 'leads#edit_contact', as: 'edit_lead_contact'
  patch '/lead/:lead_id/contact/:id', to: 'contacts#update', as: 'update_lead_contact'
  delete '/lead/:lead_id/contacts/:id', to: 'contacts#destroy', as: 'destroy_contact'

  #customer
  patch 'lead/:id', to: 'leads#convert_l2c', as: 'to_customer'
  delete 'customers/:id', to: 'customers#destroy', as: 'delete_customer'
  delete 'leads/:id', to: 'leads#destroy', as: 'delete_lead'
  post 'leads/new', to: 'leads#create'
  
  #call
  post '/lead/:lead_id/call/', to: 'calls#create', as: 'new_lead_call'
  get '/lead/:lead_id/call/:id', to: 'leads#edit_call', as: 'edit_lead_call'
  patch '/lead/:lead_id/call/:id', to: 'calls#update', as: 'update_lead_call'
  delete '/lead/:lead_id/calls/:id', to: 'calls#destroy', as: 'destroy_call'

  resources :customers
  resources :products
  resources :taxes
  resources :invoices
  resources :estimates
  resources :proposals
  resources :categories
  resources :staffs
  resources :contacts
  resources :calls

  devise_for :accounts
  root to: 'home#index'
end
