class GistsController < ApplicationController
  def create
    set_test_passage
    gist = GistQuestionService.new(@test_passage.current_question).call
    gist_params = GistStruct.new(gist.html_url)
    if gist_params.success?
      flash_options = { notice: t('.success', url: gist_params.get_gist_url) }
      created_gist = @test_passage.gists.build(question_id: @test_passage.current_question.id, 
                                              url: gist_params.get_gist_url, 
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