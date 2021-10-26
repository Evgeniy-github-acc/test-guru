class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  
  def show
  
  end

  def result
    check_badges = BadgeAssignmentService.new(current_user, @test_passage)
    check_badges.assignment
    @got_badges = check_badges.new_badges
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call

      if result.success?
        flash_options =  { notice: t('.success', link: result.gist_url) }
        current_user.gists.create(body: result.gist_url, question_id: @test_passage.current_question_id) 
      else
        flash_options = { alert: t('.failure') }
      end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? || @test_passage.time_out?
  
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else  
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
