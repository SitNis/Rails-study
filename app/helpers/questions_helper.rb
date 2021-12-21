module QuestionsHelper
  def question_header(_test, question)
    if question.new_record?
      'New question'
    else
      "Edit #{question.title} Question"
    end
  end
end
