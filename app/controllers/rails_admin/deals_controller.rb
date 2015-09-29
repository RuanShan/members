module RailsAdmin
  class DealsController < RailsAdmin::ApplicationController
    layout 'new_sale'
    include ActionView::Helpers::TextHelper
    include RailsAdmin::MainHelper
    include RailsAdmin::ApplicationHelper

    def index
      page_num = ( params[Kaminari.config.param_name] || 1).to_i
      pege_size = ( params[:per] || 16  ).to_i
      @objects = current_user.credits.page(page_num).per(pege_size)
      @page_name = '交易记录'
    end



  end
end
