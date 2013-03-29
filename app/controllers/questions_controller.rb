class QuestionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_question, only: [:show, :edit, :update, :destroy]

  def index
    
  end

  def show
    @answer = Answer.new
    @like   = (current_user && current_user.like_for(@question)) || Like.new
  end

  def new
    @question = Question.new
  end

  def create
    @question      = Question.new(params[:question])
    @question.user = current_user
    if @question.save
      redirect_to @question, notice: "Question Created Successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update_attributes(params[:question])
      redirect_to @question, notice: "Question Updated Successfully!"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def find_question
    @question = Question.find(params[:question_id] || params[:id])
  end
end