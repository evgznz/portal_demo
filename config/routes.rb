Rails.application.routes.draw do
  get 'printers_monitoring/index'
  #get 'printers_monitoring/check'

  get 'managements/help'
  match 'printers_monitoring/:id/disable_sms' , to: 'printers_monitoring#disable_sms', as: 'printers_monitoring_disable_sms',via: [:get]
  match 'printers_monitoring/:id/enable_sms' , to: 'printers_monitoring#enable_sms', as: 'printers_monitoring_enable_sms',via: [:get]
  match 'printers_monitoring/:id/check' , to: 'printers_monitoring#check', as: 'printers_monitoring_check',via: [:get]
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 # match 'management/new',to: 'management#new',as: 'management_new', via: [:get,:post]
  resources :managements 

  match 'managements/:id/email_login_password' ,to: 'managements#email_login_password',as: 'managements_email_login_password',via: [:get]
  match 'managements/:id/sms_login_password' ,to: 'managements#sms_login_password',as: 'managements_sms_login_password',via: [:get]
  match 'managements/:id/enable_login' ,to: 'managements#enable_login',as: 'managements_enable_login',via: [:get]
  match 'managements/:id/disable_login' ,to: 'managements#disable_login',as: 'managements_disable_login',via: [:get]
  resources :profiles do 
    resources :passes
  end
  root 'profiles#index'
  #get 'profile/index', to: 'profile#index' ,as: 'profile_path'

  #get 'profile/:id' ,to: 'profile#show'
  #get 'profile/create'
  match 'profiles/:profile_id/passes/:id/print(:format)',to: 'passes#print', as: 'print_profile_passes' ,via: [:get,:put,:patch]
  match 'profiles/:profile_id' ,to: 'profile#show' ,as: 'show_profile',via: [:get]
  #put 'passes/:id/print(:format)',to: 'passes#print', as: 'print_passes'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '*path', to: 'unmatch_route#not_found', via: :all
end
