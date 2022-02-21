module RuleSpecifications
  class FirstTryRule < AbstractRuleSpecification
    def satisfies?
      count_test_tries(@test, @user) == 1 && count_successful_tries(@test, @user) == 1
    end

    private

    def count_test_tries(test, user)
      user.test_passages.where(test_id: test.id).count
    end

    def count_successful_tries(test, user)
      user.test_passages.where(test_id: test.id, passed: 1).count
    end
  end
end
