module ApplicationHelper

  def get_nav_css_class( other_model_name )
    #Rails.logger.debug "controller_name=#{controller_name}, action=#{action_name}, @model_name#{@model_name} other_model_name=#{other_model_name}"
    is_current = if @model_name.present?
      @model_name =~ /#{other_model_name}/
    else
      "#{controller_name}_#{action_name}" =~ /#{other_model_name}/
    end
    is_current ? 'active' : ''
  end

end
