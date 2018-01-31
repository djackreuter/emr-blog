# controller for posts
class PostsController < ApplicationController
  # define before actions to run before any other methods
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]

  def index
    if params[:user_id].present?
      @posts = Post.where(user_id: params[:user_id]).order('created_at DESC')
    else
      @posts = Post.all.order('created_at DESC')
    end
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)

    @user = current_user

    if @post.save
      if @user.posts.count <= 1
        # ApplicationMailer.first_post_notification(@user).deliver_later
        # FirstPostMailerJob.perform_later(@user)
        FirstPostMailerJob.delay(@user.id).perform
      end
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
