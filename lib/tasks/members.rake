namespace :members do
  desc 'create sales, env "CREATE_SALES" is required, ex 3-6'
  task :create_sales => :environment  do
  #  role_model =  RailsAdmin::AbstractModel.new(Role)
  #  user_model     = RailsAdmin::AbstractModel.new(User)
  #  team_model     = RailsAdmin::AbstractModel.new(Team)

    #Spree::Core::Fixtures.reset_cache # some_table.yml maybe cached
    wholesaler_role = Role.where( name: 'wholesaler').first
    raise "env CREATE_SALES is required" unless ENV["CREATE_SALES"].present?
    startno, endno = ENV["CREATE_SALES"].split( '-')
    ((startno.to_i)..(endno.to_i)).each{|i|
      team = Team.find_or_create_by!( name: "销售#{i}部")
      user = User.find_or_initialize_by( name: "xiaosou#{i}", account: "xiaosou#{i}", email: "xiaosou#{i}@example.com", team: team ) do |user|
        user.password = '666666'
        user.roles= [ wholesaler_role ]
      end
      user.save!
      #User.new(:name=>'xiaosou1', :account => 'xiaosou1', :email => 'xiaosou1@example.com', :password => '666666', :roles=>[ wholesaler_role ], :team=>Team.find(1)).save
    }

  end
end
