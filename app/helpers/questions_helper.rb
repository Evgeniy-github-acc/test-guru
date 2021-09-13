module QuestionsHelper
  def question_header(test, question)
    if question.new_record?
      "Create question for test: #{test.title}"
    else
      "Edit question in test: #{question.test.title} "
    end
  end 
end
