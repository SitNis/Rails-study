class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy start]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_test.build(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end    
  end

  def destroy
    @test.destroy
    redirect_to admin_test_path(@test)
  end

  private

  def rescue_with_test_not_found
    render plain: "Такого теста нет!"
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title,:category_id,:level)
  end

end