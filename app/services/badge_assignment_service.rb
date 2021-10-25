class BadgeAssignmentService
  
  attr_reader :new_badges


  def initialize(user, test_passage)
    @new_badges = []
    @test_passage = test_passage
    @user = user
  end

  def assignment(user)
    Badge.all.each do |badge|
      if send("#{badge.rule}", badge.rule_param) 
        user.badges << badge
        @new_badges << badge
      end              
    end
  end

  protected

  def first_try_assign?(rule_param)
    TestPassage.user_tries(@user.id, @test_passage.test_id).size == 1
  end

  def complete_category_assign?(category_id)
    category_tests = Test.category(@test_passage.test.category_id).ids
    passed_tests = TestPassage.all.where(user_id: @user.id).where('test_passages.succeed = ?', true).pluck(:test_id)
    (category_tests & passed_tests == category_tests) && @user.badges.where(rule: 'complete_category_assign?', rule_param: category_id).empty?
  end

  def complete_level_assign?(level)
    level_tests = Test.level_sort(@test_passage.test.level).ids
    passed_tests = TestPassage.all.where(user_id: @user.id).where('test_passages.succeed = ?', true).pluck(:test_id)
    (level_tests & passed_tests == level_tests) && @user.badges.where(rule: 'complete_level_assign?', rule_param: level).empty?
  end

end