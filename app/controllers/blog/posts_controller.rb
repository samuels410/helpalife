class Blog::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :publish, :undo_publish]
  before_action :validate_journalist, only: [:new, :update, :publish, :undo_publish]
  layout 'blog'

  def index
    if current_user && current_user.has_role?(:journalist)
      @posts = Post.newest
    else
      @posts = Post.published.newest
    end
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
    impressionist(@post)
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy!
    flash[:notice] = "The post was destroyed"
    redirect_to blog_post_path
  end

  def post_notify
    @post = Post.find(params[:id])
    NotificationMailer.delay.post_notify(@post)
    flash[:notice] = "The notifications are sent"
    redirect_to blog_posts_path
  end

  def publish
    @post = Post.find(params[:id])
    @post.is_published = true
    @post.save
    flash[:notice] = "The post has been published"
    redirect_to blog_posts_path
  end

  def undo_publish
    @post = Post.find(params[:id])
    @post.is_published = false
    @post.save
    flash[:notice] = "Published as been removed"
    redirect_to blog_posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end

    def validate_journalist
      if current_user && current_user.has_role?(:journalist)
      else
        redirect_to blog_posts_path
        flash[:notice] = "You cannot do that. Please contact to the Admin"
      end
    end


end
