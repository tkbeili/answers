class AnswersController < QuestionsController
  before_filter :find_question

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
    session[:user_id] = Time.now

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer          = Answer.new(params[:answer])

    if @answer.save
      # QuestionsMailer.delay.answer_notfication(current_user, @question)
      Answers::MailHandler.new.send_mail(@question.id, current_user.id)
      # redirect_to @question, notice: 'Answer was successfully created.'
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = current_user.answers.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer.question, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
      format.js   { render js: "$('#answer_#{@answer.id}').fadeOut();"}
    end
  end
end
