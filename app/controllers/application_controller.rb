class ApplicationController < ActionController::Base

  layout :set_layout

  def forem_user
    current_user
  end
  helper_method :forem_user

  protect_from_forgery
  before_filter :set_locale

  def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
  end

  def index
  end

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def set_layout
    respond_to do |format|
      format.html do
        logger.debug "-------------------- controller :  #{params[:controller]} --------------------"
        if params[:controller] [0..4]== 'forem'
          'forem'
        else
          'application'
        end
      end
      format.json {}
      format.js {}
    end
  end

end
