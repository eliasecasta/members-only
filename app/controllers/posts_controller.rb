class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @post = Post.new
  end

  def index
    @post = Post.all
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to @post
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

end
