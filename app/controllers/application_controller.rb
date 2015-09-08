class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected
  def render_success(data = {}, msg = nil)
    render :json => {
               success: true,
               message: msg.to_s
           }.merge(data)
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

end
