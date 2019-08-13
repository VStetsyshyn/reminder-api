Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             }, controllers: { sessions: 'sessions', registrations: 'registrations' }
  get "notification_check", to: "notification#notification_check"
end
