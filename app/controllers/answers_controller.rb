class AnswersController < ApplicationController

  def index
    @answers = Answer.order("created_at ASC")
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Answer created successfully."
      redirect_to answers_path
    else
      flash.now[:danger] = "Answer not created successfully."
      render 'new'
    end
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:success] = "Answer edited successfully."
      redirect_to @answer
    else
      flash.now[:danger] = "Answer not edited successfully."
      render 'edit'
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
      params.require(:answer).permit(:description)
    end
end
