Rails.application.routes.draw do
  get 'reports/proposals'
  get 'reports/estimates'
  get 'reports/invoices'
  devise_for :admin_users
  resources :leads
  resources :customers
  resources :products
  resources :taxes
  resources :invoices
  resources :estimates
  resources :proposals
  resources :categories
  resources :staffs

  devise_for :accounts
  root to: 'home#index'
end
