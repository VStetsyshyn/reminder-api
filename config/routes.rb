Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope module: :api, path: 'api/v1' do
    scope module: :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations'
      }
    end
  end
end
