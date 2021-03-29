class Admin::WebsiteConfigsController < Admin::BaseController
    layout 'admin'
    before_action :set_website_config, only: [:edit, :update]
  
    # GET /website_configs
    # GET /website_configs.json
    def index
      @website_configs = WebsiteConfig.page(@page_index)
    end
  
    # GET /website_configs/1/edit
    def edit
    end
  
    # PATCH/PUT /website_configs/1
    # PATCH/PUT /website_configs/1.json
    def update
      respond_to do |format|
        if @website_config.update(website_config_params)
          format.html { redirect_to admin_website_configs_path, notice: t('admin.success') }
          format.json { render :show, status: :ok, location: @website_config }
        else
          format.html { render :edit }
          format.json { render json: @website_config.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_website_config
        @website_config = WebsiteConfig.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def website_config_params
        params.require(:website_config).permit(:val)
      end
  end