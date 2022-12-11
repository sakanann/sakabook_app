class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit, :update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集完了!"
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    elsif @post.save
    redirect_to posts_path, notice: "登録完了！"
    else
    render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end