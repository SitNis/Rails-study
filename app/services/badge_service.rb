class BadgeService
  include BadgeRulesCheck

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def take_badge
    Badge.select do |badge|
      give_badge(badge) if send(badge.rule_type.to_sym, @test, @user, badge.rule_parameter)
    end
  end

  private

  def give_badge(badge)
    @test_passage.user.badges.push(badge)
  end
end
