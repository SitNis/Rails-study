class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @badges = Badge.all
  end

  def give_badge
    first_try_check
    all_frontend_tests_check
    all_level_tests_check
  end

  private

  def first_try_check
    if TestPassage.where(user_id: @test_passage.user.id, test_id: @test_passage.test.id ).count == 1
      badge = @badges.find_by(name: "Well done!")
      @test_passage.user.badges.push(badge)
    end
  end

  def all_frontend_tests_check
    if passed_frontend_tests?
      if count_successfully_passed_frontend_tests == Test.tests_by("Frontend")
        badge = @badges.find_by(name: "Frontend Guru")
        @test_passage.user.badges.push(badge)
      end
    end
  end

  def all_level_tests_check
    if count_successfully_passed_same_level_tests == count_same_level_tests
      badge = @badges.find_by(name: "Next level")
      @test_passage.user.badges.push(badge)
    end
  end

  def count_same_level_tests
    Test.where(level: @test_passage.test.level).count
  end

  def count_successfully_passed_same_level_tests
    Test.
    joins(:test_passages).
    where(level: @test_passage.test.level, test_passages: { user_id: @test_passage.user.id,
                                                            passed: 1 }).
    count
  end

  def passed_frontend_tests?
    @test_passage.user.badges.find_by(name: "Frontend Guru").nil?
  end

  def count_successfully_passed_frontend_tests
    if @test_passage.test.category.title == 'Frontend'
      Test.
      joins(:test_passages).
      where(category_id: @test_passage.test.category.id, test_passages: { user_id: @test_passage.user.id, 
                                                                          passed: 1 }).
      uniq.
      count
    end
  end
end
