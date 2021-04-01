class ReportsController < ApplicationController
  before_action :set_locale
  
  def index
    @reports_active = true
    WebsiteConfig.cache!
    @s = params[:s]
    @posts = []
    case @s
    when 'specialized'
      @title = t('reports.specialized')
      @posts = PostType.find_by(slug: 'report').posts.visible.where(is_specialized_report: true).page(@page_index)
    when 'activity'
      @title = t('reports.activity')
      @posts = PostType.find_by(slug: 'report').posts.visible.where(is_activity_report: true).page(@page_index)
    else
      @posts = PostType.find_by(slug: 'report').posts.visible.page(@page_index)
    end
    @description = @title
  end

  def show
    @reports_active = true
    WebsiteConfig.cache!
    id = params[:slug].split('-').first
    @post = Post.find(id)
    @title = @post.title(current_locale)
    @description = Nokogiri::HTML(@post.content(current_locale)).text.strip
    @keywords = @title.split(' ').join(',')
  end
end