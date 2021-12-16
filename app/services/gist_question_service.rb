class GistQuestionService
  GITHUB_GIST_TOKEN = Rails.application.credentials.api_key

  attr_reader :gist

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @gist = @client.create_gist(gist_params)
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
    [@question.title, *@question.answers.pluck(:title)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: GITHUB_GIST_TOKEN)
  end
end