class AlbumsController < ApplicationController
  before_action :set_locale
  
  def index
    @album_active = true
    WebsiteConfig.cache!
    @posts = PostType.find_by(slug: 'album').posts.visible.page(@page_index)
    @title = t('header.menu.album')
    @description = t('header.menu.album')
  end

  def show
    @album_active = true
    WebsiteConfig.cache!
    @post = PostType.find_by(slug: 'album').posts.where("#{current_locale}_slug = ?", params[:slug]).first
    @title = @post.title(current_locale)
    @description = @title
    @keywords = @title.split(' ').join(',')
  end
end