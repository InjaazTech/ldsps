class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    I18n.locale = :en
  end

  def current_locale
    @current_locale ||= 'en'
  end
end