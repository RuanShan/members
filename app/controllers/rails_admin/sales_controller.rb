module RailsAdmin
  class SalesController < RailsAdmin::ApplicationController
    layout 'new_sale'
    include ActionView::Helpers::TextHelper
    include RailsAdmin::MainHelper
    include RailsAdmin::ApplicationHelper

    def index
      page_num = ( params[Kaminari.config.param_name] || 1).to_i
      pege_size = ( params[:per] || 16  ).to_i
      @objects = current_user.children( ).page(page_num).per(pege_size)
      @page_name = '销售记录'
    end

    def show
      @page_name = '销售记录'
    end

    def new
      @page_name = '我要销售'
    end

    def create
      user_params = params.require(:user).permit!
      user = User.new( user_params )
      user.account = user.cellphone
      user.parent = current_user
      Rails.logger.info " valid=#{user.valid?} user=#{user.errors.inspect}"
      if user.save
        flash[:success] = t('admin.flash.successful', action: '创建', name: '下级会员')
        redirect_to sales_path
      else
        render :new
      end
    end

  end
end
