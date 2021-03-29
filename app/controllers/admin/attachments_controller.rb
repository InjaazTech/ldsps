class Admin::AttachmentsController < Admin::BaseController
    layout 'admin'
    before_action :set_attachment, only: [:destroy]
  
    def index
    end
  
    # POST /attachments
    # POST /attachments.json
    def create
      @attachment = current_user.attachments.new(upload: params[:upload])
  
      respond_to do |format|
        if @attachment.save
          format.json { render json: {attachment: @attachment} }
        else
          format.json { render json: @attachment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /attachments/1
    # DELETE /attachments/1.json
    def destroy
      @attachment.destroy
      respond_to do |format|
        format.html { redirect_to attachments_url, notice: t('admin.success') }
        format.json { head :no_content }
      end
    end
  
    # def add_images
    #   attachments_ids = params[:attachments_ids]
    #   attachments_ids.map(&:to_i).each {|aid| @product.product_images.create(attachment_id: aid)}
    #   redirect_to admin_product_path(@product)
    # end
  
    # def remove_image
    #   @product.product_images.find_by(attachment_id: params[:attachment_id]).destroy
    #   redirect_to admin_product_attachments_path(@product)
    # end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_attachment
        @attachment = Attachment.find(params[:attachment_id])
      end
  end