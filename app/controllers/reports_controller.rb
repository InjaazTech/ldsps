class ReportsController < ApplicationController
  before_action :set_locale
  
  def index
    @reports_active = true
    WebsiteConfig.cache!
    @reports = PostType.find_by(slug: 'report').posts.page(@page_index)
    @title = t('header.menu.reports')
    @description = t('header.menu.reports')
  end

  def show
    @reports_active = true
    WebsiteConfig.cache!
    @post = PostType.find_by(slug: 'report').posts.where("#{current_locale}_slug = ?", params[:slug]).first
    @title = @post.title(current_locale)
    @description = Nokogiri::HTML(@post.content(current_locale)).text.strip
    @keywords = @title.split(' ').join(',')
  end
end