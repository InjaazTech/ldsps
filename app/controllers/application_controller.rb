class ApplicationController < ActionController::Base
  helper_method :current_locale

  def current_locale
    @current_locale ||= params[:locale] || 'en'
  end

  def set_locale
    if params[:locale].blank?
      cookies[:locale] = :en
      I18n.locale = :en
    else
      cookies[:locale] = params[:locale].to_sym
      I18n.locale = params[:locale].to_sym
    end
  end
end
