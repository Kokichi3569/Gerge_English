class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
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
    redirect_to public_posts_index_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to public_posts_index_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
