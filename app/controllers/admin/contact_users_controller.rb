class Admin::ContactUsersController < Admin::BaseController
    layout 'admin'
    before_action :set_contact_user, only: [:destroy]
  
    # GET /posts
    # GET /posts.json
    def index
      @contact_users = ContactUser.page(@page_index)
    end
  
    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
      @contact_user.destroy
      respond_to do |format|
        format.html { redirect_to admin_contact_users_url, notice: t('admin.success') }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact_user
        @contact_user = ContactUser.find(params[:id])
      end
  end