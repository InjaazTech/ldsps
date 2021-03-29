class ProjectsController < ApplicationController
  before_action :set_locale
  
  def index
    @projects_active = true
    WebsiteConfig.cache!
    @projects = PostType.find_by(slug: 'project').posts.page(@page_index)
  end

  def show
    @projects_active = true
    WebsiteConfig.cache!
    @post = PostType.find_by(slug: 'project').posts.where("#{current_locale}_slug = ?", params[:slug]).first
  end
end