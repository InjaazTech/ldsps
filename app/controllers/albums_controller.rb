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
    id = params[:slug].split('-').first
    @post = Post.find(id)
    @title = @post.title(current_locale)
    @description = @title
    @keywords = @title.split(' ').join(',')
  end
end