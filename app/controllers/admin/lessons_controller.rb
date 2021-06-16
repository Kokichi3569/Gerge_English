class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!
  def index
    @lesson = Lesson.page(params[:page]).per(10)
  end

  def show
     @lesson = lesson.find(params[:id])
  end

  def edit
    @lesson = lesson.find(params[:id])
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
      flash[:notice] = "商品の新規登録が完了しました。"
      redirect_to admin_lesson_path(@lesson)
    else
      flash[:alert] = "商品の新規登録内容に不備があります。"
      render :new
    end

  end

  private
  def lesson_params
    params.require(:lesson).permit(:image, :name, :introduction, :genre_id, :price,:is_active)
  end
end
