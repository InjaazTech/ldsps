class ProjectsController < ApplicationController
  before_action :set_locale
  
  def index
    @projects_active = true
    WebsiteConfig.cache!
    @projects = PostType.find_by(slug: 'project').posts.visible.page(@page_index)
    @title = t('header.menu.projects')
    @description = t('header.menu.projects')
  end

  def show
    @projects_active = true
    WebsiteConfig.cache!
    id = params[:slug].split('-').first
    @post = Post.find(id)
    @title = @post.title(current_locale)
    @description = Nokogiri::HTML(@post.content(current_locale)).text.strip
    @keywords = @title.split(' ').join(',')
  end
end