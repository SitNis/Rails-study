module RuleSpecification
  class CompleteSameLevelTestsRule < AbstractRuleSpecification
    def satisfies?
      count_successfully_passed_same_level_tests(@test, @user, @rule_parameter) == count_parameter_level_tests(@rule_parameter) && 
      already_achived?(@user, @rule_parameter)
    end

    private

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

    def already_achived?(user,rule_parameter)
      user.badges.find_by(rule_parameter: rule_parameter).nil?
    end
  end
end
