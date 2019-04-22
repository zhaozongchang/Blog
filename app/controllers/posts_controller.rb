class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to posts_path
  else
    render 'new'
   end
  end

  def edit
    @post = Post.find_by_friendly_id!(params[:id])
  end

  def update
    @post = Post.find_by_friendly_id!(params[:id])
    @post.update(post_params)
    if @post.save
    redirect_to posts_path
  else
    render 'eidt'
   end
  end

  def show
    @post = Post.find_by_friendly_id!(params[:id])
  end

  def destroy
    @post = Post.find_by_friendly_id!(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body,:friendly_id,:status, :category_id)
  end

end
