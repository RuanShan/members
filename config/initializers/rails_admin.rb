
RailsAdmin.config do |c|
  c.main_app_name = ["Cool app", "BackOffice"]
  c.excluded_models = ['RelTest','Player']
  c.authenticate_with {}
  c.current_user_method { User.first }
  c.authorize_with :cancan
  c.audit_with :history, User
end
