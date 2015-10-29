#require Rails.root.join('lib', 'rails_admin', 'new_sale.rb')
#RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::NewSale)

RailsAdmin.config do |config|
  config.main_app_name = ["微商", "管理系统"]
  #config.excluded_models = ['RelTest','Player']
  config.included_models = [ "CompanyNotice", "Team", "User", "Credit"]

  config.authenticate_with {}
  config.current_user_method {
    current_user#User.first
  }
  config.authorize_with :cancan
  config.audit_with :history, User


  config.model 'Team' do
    navigation_label '基本设置'
    weight 0
    field :name
    list do
      field :created_at
    end
  end

  config.model 'CompanyNotice' do
    navigation_label '公司公告'
    weight 1
    list do
      field :id
      field :title
      field :created_at
    end
  end

  config.model 'User' do
    navigation_label '会员管理'
    weight 2
    list do
      field :id
      field :account
      field :name
      field :bank_num
      field :team
    end

    create do
      field :account
      field :name
      field :cellphone
      field :email
      field :password
      field :password_confirmation
      #field :roles
      field :team
      field :notes
    end

    edit do
      field :name
      field :team
      field :cellphone
      field :card_num
      field :bank_name
      field :bank_num
      field :address
      field :notes
    end

    show do
      field :account
      field :name
      field :team
      field :cellphone
      field :card_num
      field :bank_name
      field :bank_num
      field :address
      field :notes
    end
  end

  config.model 'Credit' do
    navigation_label '账户管理'
    weight 3
    list do
      field :id
      field :user
      field :amount
      field :notes
      field :created_at
    end
    field :user
    field :amount
    field :notes
  end

  config.actions do
    # root actions
    dashboard do
      statistics false
    end

    # collection actions
    index                         # mandatory
    new
    #export
    #history_index
    #bulk_delete
    # member actions
    show
    edit
    delete
    #history_show
    show_in_app
  end

end
