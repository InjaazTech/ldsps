class Admin::WpagesController < Admin::BaseController
    layout 'admin'
    before_action :set_wpage, only: [:show, :edit, :update, :destroy]
  
    # GET /wpages
    # GET /wpages.json
    def index
      @wpages = Wpage.all.page(@page_index)
    end
  
    # GET /wpages/1
    # GET /wpages/1.json
    def show
    end
  
    # GET /wpages/new
    def new
      @wpage = Wpage.new
    end
  
    # GET /wpages/1/edit
    def edit
    end
  
    # POST /wpages
    # POST /wpages.json
    def create
      @wpage = Wpage.new(wpage_params)
  
      respond_to do |format|
        if @wpage.save
          format.html { redirect_to admin_wpage_path(@wpage), notice: t('admin.success') }
          format.json { render :show, status: :created, location: @wpage }
        else
          format.html { render :new }
          format.json { render json: @wpage.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /wpages/1
    # PATCH/PUT /wpages/1.json
    def update
      respond_to do |format|
        if @wpage.update(wpage_params)
          format.html { redirect_to admin_wpage_path(@wpage), notice: t('admin.success') }
          format.json { render :show, status: :ok, location: @wpage }
        else
          format.html { render :edit }
          format.json { render json: @wpage.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /wpages/1
    # DELETE /wpages/1.json
    def destroy
      @wpage.destroy
      respond_to do |format|
        format.html { redirect_to admin_wpages_url, notice: t('admin.success') }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_wpage
        @wpage = Wpage.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def wpage_params
        params.require(:wpage).permit(:ar_title, :en_title, :tr_title, :ar_content, :en_content, :tr_content, :show_header, :show_footer)
      end
  end