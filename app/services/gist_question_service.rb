class GistQuestionService

  ACCESS_TOKEN = Rails.application.credentials.api_key

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(  access_token: ACCESS_TOKEN)  
  end

  def call
    result = @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.gist_params.question', title: @question.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.title]
    content += @question.answers.pluck(:title)
    content.join("\n")
  end

end