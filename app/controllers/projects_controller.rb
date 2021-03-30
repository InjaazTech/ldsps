class ProjectsController < ApplicationController
  before_action :set_locale
  
  def index
    @projects_active = true
    WebsiteConfig.cache!
    @projects = PostType.find_by(slug: 'project').posts.page(@page_index)
    @title = t('header.menu.projects')
    @description = t('header.menu.projects')
  end

  def show
    @projects_active = true
    WebsiteConfig.cache!
    @post = PostType.find_by(slug: 'project').posts.where("#{current_locale}_slug = ?", params[:slug]).first
    @title = @post.title(current_locale)
    @description = Nokogiri::HTML(@post.content(current_locale)).text.strip
    @keywords = @title.split(' ').join(',')
  end
end