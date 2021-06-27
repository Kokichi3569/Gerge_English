class Public::LessonsController < ApplicationController
  def index
    @total_lesson = Lesson.all
    @lessons = Lesson.all.page(params[:page]).per(8)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private
  def lessons_params
    params.require(:lesson).permit(:genre_id, :name, :introduction, :price, :is_active, :image_id)
  end

end
