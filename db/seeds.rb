#require 'mlb'
role_model =  RailsAdmin::AbstractModel.new(Role)
user_model     = RailsAdmin::AbstractModel.new(User)
league_model   = RailsAdmin::AbstractModel.new(League)
division_model = RailsAdmin::AbstractModel.new(Division)
team_model     = RailsAdmin::AbstractModel.new(Team)
player_model   = RailsAdmin::AbstractModel.new(Player)

[{ name: '卖家(890元/年)', category: 'sale'}].each{|attrs|
  role = role_model.new( attrs)
  role.save
}
[{ name: '销售一部'},{ name: '销售二部'}].each{|attrs|
  role = team_model.new( attrs)
  role.save
}

admin_role = role_model.new( name: 'admin')
admin_role.save
user_model.new(:name=>'admin', :account => 'admin', :email => 'admin@example.com', :password => 'password', :roles=>[ admin_role ]).save

wholesaler_role = role_model.new( name: 'wholesaler')
wholesaler_role.save
user_model.new(:name=>'xiaosou1', :account => 'xiaosou1', :email => 'xiaosou1@example.com', :password => '666666', :roles=>[ wholesaler_role ], :team=>Team.find(1)).save
user_model.new(:name=>'xiaosou2', :account => 'xiaosou2', :email => 'xiaosou2@example.com', :password => '666666', :roles=>[ wholesaler_role ], :team=>Team.find(2)).save

#MLB::Team.all.each do |mlb_team|
#  unless league = league_model.where(:name => mlb_team.league).first
#    league = league_model.new(:name => mlb_team.league)
#    league.save
#  end
#  unless division = division_model.where(:name => mlb_team.division).first
#    division = division_model.new(:name => mlb_team.division, :league => league)
#    division.save
#  end
#  unless team = team_model.where(:name => mlb_team.name).first
#    team = team_model.new(:name => mlb_team.name, :logo_url => mlb_team.logo_url, :manager => mlb_team.manager, :ballpark => mlb_team.ballpark, :mascot => mlb_team.mascot, :founded => mlb_team.founded, :wins => mlb_team.wins, :losses => mlb_team.losses, :win_percentage => ("%.3f" % (mlb_team.wins.to_f / (mlb_team.wins + mlb_team.losses))).to_f, :division => division)
#    team.save
#  end
#  mlb_team.players.reject{|player| player.number.nil?}.each do |player|
#    player_model.new(:name => player.name, :number => player.number, :position => player.position, :team => team).save
#  end
#end

puts "Seeded #{league_model.count} leagues, #{division_model.count} divisions, #{team_model.count} teams and #{player_model.count} players"
