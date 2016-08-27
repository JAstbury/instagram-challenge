class PostsController < ApplicationController

before_action :authenticate_user!, :except => [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      flash[:notice] = 'You did not create this post!'
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.update(post_params)
    else
      flash[:notice] = 'You did not create this restaurant!'
    end
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
      flash[:notice] = 'Post deleted!'
    else
      flash[:notice] = 'You did not create this restaurant!'
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
