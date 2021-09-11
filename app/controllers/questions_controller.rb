class QuestionsController < ApplicationController
  
  before_action :define_question, only: [:show]
  before_action :define_test, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<h1>Test: <%= @test.title %></h1>
                    <% @test.questions.each do |question| -%>
                    <%= content_tag :p, question.id %> 
                    <%= content_tag :p, question.body %>
                    <% end -%>'
  end

  def show
    render inline: '<div>Question: <%= @question.id %>  <%= @question.body %></div>
                    <div>in Test: <%= @question.test.title %></div>'
  end

  def new
    @question = Question.new
  end
  
  def create
    question = @test.questions.new(params.require(:question).permit(:body))
  end

  def destroy
    @question.destroy
  end

  private
  def define_test
    @test = Test.find(params[:test_id])
  end
  
  def define_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render html: '<p>Qeustion not found</p>'.html_safe
  end
    
end
