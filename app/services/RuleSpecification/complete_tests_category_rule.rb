module RuleSpecification
  class CompleteTestsCategoryRule < AbstractRuleSpecification
    def satisfies?
      count_successfully_passed_category_tests(@test, @user, @rule_parameter) == count_category_tests(@rule_parameter) && 
      already_achived?(@user, @rule_parameter)
    end

    private

    def count_category_tests(rule_parameter)
      Test.tests_by(rule_parameter).count
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

    def already_achived?(user,rule_parameter)
      user.badges.find_by(rule_parameter: rule_parameter).nil?
    end
  end
end
