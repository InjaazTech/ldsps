class Admin::SlidersController < Admin::BaseController
  layout 'admin'
  before_action :set_slider, only: [:show, :edit, :update, :destroy]

  # GET /sliders
  # GET /sliders.json
  def index
    @sliders = Slider.order(order_position: :asc).page(@page_index)
  end

  # GET /sliders/1
  # GET /sliders/1.json
  def show
  end

  # GET /sliders/new
  def new
    @slider = Slider.new
  end

  # GET /sliders/1/edit
  def edit
  end

  # POST /sliders
  # POST /sliders.json
  def create
    @slider = Slider.new(slider_params)

    respond_to do |format|
      if @slider.save
        format.html { redirect_to admin_slider_path(@slider), notice: t('admin.success') }
        format.json { render :show, status: :created, location: @slider }
      else
        format.html { render :new }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sliders/1
  # PATCH/PUT /sliders/1.json
  def update
    respond_to do |format|
      if @slider.update(slider_params)
        format.html { redirect_to admin_slider_path(@slider), notice: t('admin.success') }
        format.json { render :show, status: :ok, location: @slider }
      else
        format.html { render :edit }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sliders/1
  # DELETE /sliders/1.json
  def destroy
    @slider.destroy
    respond_to do |format|
      format.html { redirect_to admin_sliders_url, notice: t('admin.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider
      @slider = Slider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def slider_params
      params.require(:slider).permit(:attachment_id, :link, :position, :hidden, :ar_link_title, :en_link_title, :tr_link_title, :ar_title, :en_title, :tr_title, :ar_subtitle, :en_subtitle, :tr_subtitle)
    end
end