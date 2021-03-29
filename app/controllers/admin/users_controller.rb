class Admin::UsersController < Admin::BaseController
  layout 'admin'
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_url, notice: t('admin.success') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_url, notice: t('admin.success') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: t('admin.success') }
      format.json { head :no_content }
    end
  end

  def account
    @user = current_user
  end

  def update_account
    @user = current_user
    if user_params[:password].present?
      @user.validate_password(user_params[:current_password])
      @user.send(:update_attributes, user_params.except(:current_password)) if @user.errors.empty?
    else
      @user.send(:update_without_password, user_params.except(:password, :current_password))
    end
    respond_to do |format|
      if @user.errors.empty?
        format.html { redirect_to admin_account_path, notice: t('admin.success') }
        format.json { render :show, status: :ok, location: @user }
      else
        set_active_plan
        format.html { render 'account' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end