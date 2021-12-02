class QuestionsController < ApplicationController

  before_action :current_test, only: %i[index create]
  before_action :current_question, only: %i[destroy show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:title)
  end

  def show
  end

  def create
    question = Question.create(title: params['question']['title'], test_id:params['test_id'])
  end

  def new
  end

  def destroy
    @question.destroy
  end

  private

  def current_test
    @test = Test.find(params['test_id'])
  end

  def current_question
    @question = Question.find(params['id'])
  end

  def rescue_with_question_not_found
    render plain: "Такого вопроса нет!"
  end

end
