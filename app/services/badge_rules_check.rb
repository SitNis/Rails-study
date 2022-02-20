module BadgeRulesCheck
  def category(test,user,rule_parameter)
    count_successfully_passed_category_tests(test, user, rule_parameter) == count_category_tests(rule_parameter) && 
    already_achived?(user, rule_parameter)
  end

  def level(test,user,rule_parameter)
    count_successfully_passed_same_level_tests(test, user,rule_parameter) == count_parameter_level_tests(rule_parameter) && 
    already_achived?(user, rule_parameter)
  end

  def first_try(test,user, rule_parameter = nil)
    count_test_tries(test, user) == 1 && count_successful_tries(test, user) == 1
  end

  private

  def already_achived?(user,rule_parameter)
    user.badges.find_by(rule_parameter: rule_parameter).nil?
  end

  def count_successfully_passed_category_tests(test, user, rule_parameter)
    if test.category.title  == rule_parameter
      Test.
      joins(:test_passages).
      where(category_id: test.category.id, test_passages: { user_id: user.id, 
                                                          passed: 1 }).
      uniq.
      count
    end
  end

  def count_category_tests(rule_parameter)
    Test.tests_by(rule_parameter).count
  end

  def count_parameter_level_tests(rule_parameter)
    Test.where(level: rule_parameter.to_i).count
  end

  def count_successfully_passed_same_level_tests(test, user, rule_parameter)
    if test.level == rule_parameter.to_i
      Test.
      joins(:test_passages).
      where(level: test.level, test_passages: { user_id: @test_passage.user.id,
                                                            passed: 1 }).
      uniq.
      count
    end
  end

  def count_test_tries(test, user)
    user.test_passages.where(test_id: test.id).count
  end

  def count_successful_tries(test, user)
    user.test_passages.where(test_id: test.id, passed: 1).count
  end
end
