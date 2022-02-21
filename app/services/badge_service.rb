class BadgeService
  include RuleSpecification

  RULES = {
    'First try': FirstTryRule,
    'Category': CompleteTestsCategoryRule,
    'Level': CompleteSameLevelTestsRule
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    self.take_badge
  end

  def take_badge
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(badge.rule_parameter, @test_passage)
      give_badge(badge) if rule.satisfies?
    end
  end

  private

  def give_badge(badge)
    @test_passage.user.badges << badge
  end
end
