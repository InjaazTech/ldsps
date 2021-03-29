class ReportsController < ApplicationController
  before_action :set_locale
  
  def index
    @reports_active = true
    WebsiteConfig.cache!
    @reports = PostType.find_by(slug: 'report').posts.page(@page_index)
  end

  def show
    @reports_active = true
    WebsiteConfig.cache!
    @post = PostType.find_by(slug: 'report').posts.where("#{current_locale}_slug = ?", params[:slug]).first
  end
end