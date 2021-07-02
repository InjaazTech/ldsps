class ApplicationController < ActionController::Base
  #http_basic_authenticate_with :name => ENV['AUTH_USER'], :password => ENV['AUTH_PASS']
  helper_method :current_locale

  def current_locale
    @current_locale ||= params[:locale] || 'ar'
  end

  def set_locale
    if params[:locale].blank?
      cookies[:locale] = :ar
      I18n.locale = :ar
    else
      cookies[:locale] = params[:locale].to_sym
      I18n.locale = params[:locale].to_sym
    end
  end
end
