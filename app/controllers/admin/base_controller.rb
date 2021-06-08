class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_locale
  before_action :set_page_index

  def set_locale
    I18n.locale = :en
  end

  def current_locale
    @current_locale ||= 'en'
  end

  def set_page_index
    @page_index = params[:page] || 1
  end
end