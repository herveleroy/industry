class ApplicationController < ActionController::Base
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

end
