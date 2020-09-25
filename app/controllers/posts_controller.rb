class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    user_id = current_user.id
    @post.user_id = user_id

    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
