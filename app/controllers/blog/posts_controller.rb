class Blog::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update]
  layout 'blog'

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post
    if @post.save
      flash[:notice] = "The post was created!"
      redirect_to blog_post_path(@post)

    else
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update_attributes(post_params)
      flash[:notice] = "The post was updated!"
      redirect_to blog_post_path(@post)
    else
      render :edit
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy!
    flash[:notice] = "The post was destroyed"
    redirect_to blog_post_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end

end
