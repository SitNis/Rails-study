module RuleSpecification
  class AbstractRuleSpecification
    def initialize(rule_parameter, test_passage)
      @rule_parameter = rule_parameter
      @test_passage = test_passage
      @user = test_passage.user
      @test = test_passage.test
    end

    def satisfies?
      raise "#{__method__} undefined for #{self.class}"
    end
  end
end
