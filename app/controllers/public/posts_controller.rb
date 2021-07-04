class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    tags = Vision.get_image_data(post.image)
    tags.each do |tag|
      post.tags.create(name: tag)
    end
    redirect_to public_posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def destroy
    post = Post.find(params[:id])
    post.delete
    redirect_to public_posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to public_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
