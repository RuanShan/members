DummyApp::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  root :to => "rails_admin/main#dashboard", controller: 'rails_admin/main', action: 'dashboard'

  # https://github.com/sferik/rails_admin/issues/362
  get ':controller(/:action(/:id(.:format)))'
end
