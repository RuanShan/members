class ValidationController < ApplicationController
  def email
    #"user"=>{"email"=>"design@dalianshops.com"}
    user_params = params.require(:user).permit!
    render json: !User.exists?( email: user_params[:email] )
  end
  def account
    #"user"=>{"email"=>"design@dalianshops.com"}
    user_params = params.require(:user).permit!
    render json: !User.exists?( account: user_params[:account] )
  end
end
