class GistsController < ApplicationController
  def create
    set_test_passage
    gist = GistQuestionService.new(@test_passage.current_question).build_gist
    if gist.success?
      flash_options = { notice: t('.success', url: gist.url) }
      created_gist = @test_passage.gists.build(question_id: @test_passage.current_question.id,
                                               url: gist.url,
                                               user_email: @test_passage.user.email)
      created_gist.save
    else
      flash_options = { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
