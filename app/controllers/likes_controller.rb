class LikesController < QuestionsController
  before_filter :find_question
  
  def create
    @like          = Like.new
    @like.user     = current_user
    @like.question = @question
    if !current_user.has_liked?(@question) && @like.save
      redirect_to @question, notice: "You Liked the question! Thanks"
    else
      redirect_to @question, alert: "Sorry you couldn't like it!!"
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      redirect_to @question, notice: "You UnLiked the question!"
    else
      redirect_to @question, notice: "Sorry you couldn't unlike it!"
    end
  end

end