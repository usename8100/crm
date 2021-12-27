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
  get '/leads/new/:role', to: 'leads#new', as: 'new_lead_2'
  post 'leads/new/:role', to: 'leads#create'
  patch 'leads/:id', to: 'leads#update', as: 'update_lead'
  patch 'customers/:id', to: 'customers#update', as: 'update_customer'

  #call
  post '/lead/:lead_id/call/', to: 'calls#create', as: 'new_lead_call'
  get '/lead/:lead_id/call/:id', to: 'leads#edit_call', as: 'edit_lead_call'
  patch '/lead/:lead_id/call/:id', to: 'calls#update', as: 'update_lead_call'
  delete '/lead/:lead_id/calls/:id', to: 'calls#destroy', as: 'destroy_call'

  #item
  post 'products/new', to: 'products#create'
  delete '/product/:id', to: 'products#destroy', as: 'delete_product'
  patch '/product/:id', to: 'products#update', as: 'update_product' 
  get '/product/:id/edit', to: 'products#edit', as: 'edit_product'
  patch 'products/:id', to: 'products#convert_status', as: 'convert_status'
  #get '/product/:id', to: 'products#index'

  #staff
  post 'staffs/new', to: 'staffs#create'
  delete 'staffs/:id', to: 'staffs#destroy', as: 'delete_staff'
  get '/staff/:id/edit', to: 'staffs#edit', as: 'edit_staff'
  patch 'staff/:user_id/accounts/:id', to: 'staffs#update', as: 'update_staff' 

  #appointment
  post '/lead/:lead_id/appointment/', to: 'appointments#create', as: 'new_lead_appointment'
  get '/lead/:lead_id/appointment/:id', to: 'leads#edit_appointment', as: 'edit_lead_appointment'
  patch '/lead/:lead_id/appointment/:id', to: 'appointments#update', as: 'update_lead_appointment'
  delete '/lead/:lead_id/appointment/:id', to: 'appointments#destroy', as: 'destroy_appointment'
  get '/lead/:lead_id/appointment/:id/send_appointment', to: 'appointments#send_appointment', as: 'send_appointment'

  #note
  post '/lead/:lead_id/note/', to: 'notes#create', as: 'new_lead_note'
  delete '/lead/:lead_id/note/:id', to: 'notes#destroy', as: 'destroy_note'
  get '/lead/:lead_id/note/:id', to: 'leads#edit_note', as: 'edit_lead_note'
  patch '/lead/:lead_id/note/:id', to: 'notes#update', as: 'update_lead_note'

  #proposal
  get '/lead/:customer_id/proposal/new', to: 'proposals#new', as: 'new_lead_proposal'
  post '/lead/:customer_id/proposal/new', to: 'proposals#create'
  delete '/lead/:customer_id/proposal/:id', to: 'proposals#destroy', as: 'destroy_proposal'
  get '/lead/:customer_id/proposal/:id/edit', to: 'leads#edit_proposal', as: 'edit_lead_proposal'
  patch '/lead/:customer_id/proposal/:id', to: 'proposals#update', as: 'update_lead_proposal'
  get '/lead/:customer_id/proposal/:id', to: 'proposals#show', as: 'show_lead_proposal'

  #tax
  post 'taxes/new', to: 'taxes#create' 
  patch 'taxes/:id', to: 'taxes#update'
  delete 'taxes/:id', to: 'taxes#destroy', as: 'delete_tax'

  resources :customers
  resources :products do
    collection do 
      post :create_from_proposal
    end
  end
  resources :taxes
  resources :invoices
  resources :estimates
  resources :proposals do
    collection do
      post :send_proposal
    end
  end
  resources :reports do
    collection do
      match 'search' => 'reports#search', via: [:get, :post], as: :search
    end
  end
  resources :categories
  resources :staffs
  resources :contacts
  resources :calls
  resources :notes
  resources :appointments do
    collection do
      post :send_appointment
    end
  end
  devise_for :accounts
  root to: 'home#index'
end
