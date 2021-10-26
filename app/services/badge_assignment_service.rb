class BadgeAssignmentService
  
  attr_reader :new_badges


  def initialize(user, test_passage)
    @new_badges = []
    @test_passage = test_passage
    @user = user
  end

  def assignment
    Badge.all.each do |badge|
      if send("#{badge.rule}", badge.rule_param) 
        @user.badges << badge
        @new_badges << badge
      end              
    end
  end

  protected

  def first_try_assign?(rule_param)
    TestPassage.all.where(user_id: @user.id, test_id: @test_passage.test_id).count == 1 && @test_passage.succeed 
  end

  def complete_category_assign?(category_title)
    category_tests = Test.tests_by_category_title(category_title)
    passed_tests = category_tests.user_succeed_tests(@user.id)
    passed_tests.ids == category_tests.ids && @user.badges.where(rule: 'complete_category_assign?', rule_param: category_title).empty?
  end

  def complete_level_assign?(level)
    level_tests = Test.level_sort(@test_passage.test.level)
    passed_tests = level_tests.user_succeed_tests(@user.id)
    passed_tests == level_tests && @user.badges.where(rule: 'complete_level_assign?', rule_param: level).empty?
  end

end