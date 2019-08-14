Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope module: :api, defaults: { format: 'json' }, path: 'api/v1' do
    scope module: :v1 do
      devise_for :users, path: '',
                         path_names: {
                           sign_in: 'login',
                           sign_out: 'logout',
                           registration: 'signup'
                         }, controllers: {
                           sessions: 'api/v1/sessions',
                           registrations: 'api/v1/registrations'
                         }
      resources :notes
    end
  end
end
