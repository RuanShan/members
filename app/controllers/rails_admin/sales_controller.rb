module RailsAdmin
  class SalesController < RailsAdmin::ApplicationController
    layout 'new_sale'
    include ActionView::Helpers::TextHelper
    include RailsAdmin::MainHelper
    include RailsAdmin::ApplicationHelper

    def show
    end

    def new
    end

    def create
      user_params = params.require(:user).permit!
      user = User.new( user_params )
      user.parent = current_user
      if user.save
        flash[:success] = t('admin.flash.successful', action: '创建', name: '下级会员')
        redirect_to sales_path
      else
        render :new
      end
    end

  end
end
