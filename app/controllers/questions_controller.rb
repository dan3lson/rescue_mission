class QuestionsController < ApplicationController

  def index
    @questions = Question.order("created_at ASC")
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question created successfully."
      redirect_to questions_path
    else
      flash.now[:danger] = "Question not created successfully."
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "Question edited successfully."
      redirect_to @question
    else
      flash.now[:danger] = "Question not edited successfully."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = "Question deleted successfully."
      redirect_to questions_path
    else
      flash.now[:danger] = "Question not deleted."
      redirect_to question_path(@question)
    end
  end

  private
    def question_params
      params.require(:question).permit(:user_id, :title, :description)
    end
end
