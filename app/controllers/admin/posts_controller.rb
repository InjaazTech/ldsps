class Admin::PostsController < Admin::BaseController
    layout 'admin'
    # before_action :check_super_admin!
    before_action :set_post, only: [:show, :edit, :update, :destroy]
  
    # GET /posts
    # GET /posts.json
    def index
      @post_type_id = params[:post_type_id].to_i
      @q = params[:q]
      case @post_type_id
      when 0
        @posts = @q.blank? ? Post.all.page(@page_index) : Post.en_title_like(@q).page(@page_index)
      else
        @posts = PostType.find(@post_type_id).posts.page(@page_index)
      end
    end
  
    # GET /posts/1
    # GET /posts/1.json
    def show
    end
  
    # GET /posts/new
    def new
      @post = params[:type].blank? ? Post.new : Post.new(post_type: PostType.find_by_slug(params[:type]))
    end
  
    # GET /posts/1/edit
    def edit
      @title = I18n.t('helpers.links.edit')
    end
  
    # POST /posts
    # POST /posts.json
    def create
      @post = Post.new(post_params)
  
      respond_to do |format|
        if @post.save
          unless params[:attachments_ids].blank?
            attachments_ids = params[:attachments_ids]
            attachments_ids.map(&:to_i).each {|aid| @post.post_images.create(attachment_id: aid)}
          end
          format.html { redirect_to admin_post_path(@post), notice: t('admin.success') }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          unless params[:attachments_ids].blank?
            attachments_ids = params[:attachments_ids]
            attachments_ids.map(&:to_i).each {|aid| @post.post_images.create!(attachment_id: aid)}
          end
          format.html { redirect_to admin_post_path(@post), notice: t('admin.success') }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to admin_posts_url, notice: t('admin.success') }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:is_activity_report,:is_specialized_report,:show_homepage,:attachment_id, :post_type_id, :ar_title, :en_title, :tr_title, :ar_subtitle, :is_published, :en_subtitle, :tr_subtitle, :ar_content, :en_content, :tr_content, :ar_video_url, :en_video_url, :price, :speed_limit, :seo_limit, :order_position, :keywords_tasks_limit, :attachments_ids => [])
      end
  end