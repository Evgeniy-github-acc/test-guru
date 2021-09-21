class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :define_question, only: %i[new create]
  before_action :set_answer, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)
    
    if @answer.save
      redirect_to @answer, notice: "Answer was successfully created."
    else
     render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: "Answer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question, notice: "Answer was successfully destroyed." 
  end

  private
    
    def define_question
      @question = Question.find(params[:question_id])
    end  
    
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end
