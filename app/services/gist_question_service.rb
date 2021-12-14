class GistQuestionService

  ACCESS_TOKEN = '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'

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(  access_token: ACCESS_TOKEN)  
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
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