class QuestionsController < ApplicationController

  before_action :current_test, only: %i[index create new]
  before_action :current_question, only: %i[destroy show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:title)
  end

  def show
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new()
  end

  def destroy
    @question.destroy
    redirect_to tests_path
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end    
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def current_test
    @test = Test.find(params[:test_id])
  end

  def current_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Такого вопроса нет!"
  end

end
