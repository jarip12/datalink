class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_staff!
  alias_method :current_user, :current_staff


  protected
  def render_success(data = {}, msg = nil)
    render :json => {
               success: true,
               message: msg.to_s
           }.merge(data)
  end

  def current_staff
    @current_staff
  end

  def login_as(staff)
    @current_staff = staff
  end

  def render_fail(msg = nil, model = nil)
    res = {
        success: false,
        message: msg.to_s,
    }

    if model
      if model.kind_of?(Hash)
        res.merge!(model)
      else
        res.merge!( errors: flatten_errors(model.errors.messages) )
      end
    end

    render :json => res
  end

  def hour_minute_display(a_date)
    if a_date.hour > 12
      return "下午 #{a_date.hour - 12}:#{a_date.strftime('%M')}"
    else
      return "上午#{a_date.strftime('%k:%M')}"
    end
  end

end
