class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %i[start]
  before_action :check_empty_test, only: %i[start]
    
  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def check_empty_test
    render html: '<h1> Test is empty</h1>'.html_safe if @test.questions.first.nil?
  end
end
