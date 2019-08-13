Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
<<<<<<< HEAD
  devise_for :users, path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             }, controllers: { sessions: 'sessions', registrations: 'registrations' }
  get "notification_check", to: "notification#notification_check"
=======

  scope module: :api, path: 'api/v1' do
    scope module: :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations'
      }
    end
  end
>>>>>>> origin
end
