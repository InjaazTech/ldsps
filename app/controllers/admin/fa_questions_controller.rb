class Admin::FaQuestionsController < Admin::BaseController
    layout 'admin'
    before_action :set_fa_question, only: [:show, :edit, :update, :destroy]
  
    # GET /fa_questions
    # GET /fa_questions.json
    def index
      @fa_questions = FaQuestion.order(order_position: :asc)
    end
  
    # GET /fa_questions/1
    # GET /fa_questions/1.json
    def show
    end
  
    # GET /fa_questions/new
    def new
      @fa_question = FaQuestion.new
    end
  
    # GET /fa_questions/1/edit
    def edit
    end
  
    # POST /fa_questions
    # POST /fa_questions.json
    def create
      @fa_question = FaQuestion.new(fa_question_params)
  
      respond_to do |format|
        if @fa_question.save
          format.html { redirect_to admin_fa_question_path(@fa_question), notice: t('admin.success') }
          format.json { render :show, status: :created, location: @fa_question }
        else
          format.html { render :new }
          format.json { render json: @fa_question.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /fa_questions/1
    # PATCH/PUT /fa_questions/1.json
    def update
      respond_to do |format|
        if @fa_question.update(fa_question_params)
          format.html { redirect_to admin_fa_question_path(@fa_question), notice: t('admin.success') }
          format.json { render :show, status: :ok, location: @fa_question }
        else
          format.html { render :edit }
          format.json { render json: @fa_question.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /fa_questions/1
    # DELETE /fa_questions/1.json
    def destroy
      @fa_question.destroy
      respond_to do |format|
        format.html { redirect_to admin_fa_questions_url, notice: t('admin.success') }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_fa_question
        @fa_question = FaQuestion.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def fa_question_params
        params.require(:fa_question).permit(:ar_question, :en_question, :tr_question, :ar_answer, :en_answer, :tr_answer, :order_position, :hidden)
      end
  end