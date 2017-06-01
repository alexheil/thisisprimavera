class Posts::PostsController < ApplicationController

  before_action :authenticate_alex!, except: [:index, :show]

  def index
  	@posts = Post.all
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id]).destroy
    redirect_to root_url
  end

  private

    def post_params
      params.require(:post).permit(:title, :author, :image, :subtitle, :content, :slug)
    end

    def authenticate_alex!
      @user = current_user
      redirect_to posts_path if @user.username != "alexheil"
    end

end