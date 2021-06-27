class Admin::LessonsController < ApplicationController
   before_action :authenticate_admin!
  def index
    @lessons = Lesson.page(params[:page]).per(10)
  end

  def show
     @lesson = Lesson.find(params[:id])
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
     @lesson = Lesson.find(params[:id])
     if @lesson.update(lesson_params)
       flash[:notice] = "商品詳細の変更が完了しました。"
       redirect_to admin_lesson_path(@lesson)
     else
       flash[:alert] = "商品詳細の変更内容に不備があります。"
       render :edit
     end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = "授業の新規登録が完了しました。"
      redirect_to admin_lessons_path
    else
      flash[:alert] = "授業の新規登録内容に不備があります。"
      render :new
    end

  end

  private
  def lesson_params
    params.require(:lesson).permit(:image, :lesson_name, :introduction, :price,:is_active)
  end
end
