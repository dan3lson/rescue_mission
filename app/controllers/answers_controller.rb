class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:success] = "Answer created successfully."
      redirect_to question_path(@question)
    else
      flash.now[:danger] = "Answer not created successfully."
      render "questions/show"
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      flash[:success] = "Answer edited successfully."
      redirect_to @answer
    else
      flash.now[:danger] = "Answer not edited successfully."
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    if @answer.destroy
      flash[:success] = "Answer deleted successfully."
      redirect_to answers_path
    else
      flash.now[:danger] = "Answer not deleted."
      redirect_to answer_path(@answer)
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:description, :question_id)
    end
end
