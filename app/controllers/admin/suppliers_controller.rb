class Admin::SuppliersController < Admin::BaseController
  layout 'admin'
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /Suppliers
  # GET /Suppliers.json
  def index
    @suppliers = Supplier.order(order_position: :asc).page(@page_index)
  end

  # GET /Suppliers/1
  # GET /Suppliers/1.json
  def show
  end

  # GET /Suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /Suppliers/1/edit
  def edit
  end

  # POST /Suppliers
  # POST /Suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to admin_supplier_path(@supplier), notice: t('admin.success') }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Suppliers/1
  # PATCH/PUT /Suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to admin_supplier_path(@supplier), notice: t('admin.success') }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Suppliers/1
  # DELETE /Suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to admin_Suppliers_url, notice: t('admin.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:attachment_id, :link, :order_position)
    end
end