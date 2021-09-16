class QuestionsController < ApplicationController
  
  before_action :define_question, only: [:show, :edit, :update, :destroy]
  before_action :define_test, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  
  end

  def new
    @question = Question.new
  end
  
  def edit
  end

  def update
    @question.update(question_params)
    redirect_to question_path(@question)
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render inline: '<h1>Question created</h1>'
    else
      render inline: '<h1>Error check your params</h1>'
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
  end

  private
  def define_test
    @test = Test.find(params[:test_id])
  end
  
  def define_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render html: '<p>Qeustion not found</p>'.html_safe
  end
    
end
