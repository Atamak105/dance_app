class PostsController < ApplicationController
  
  def create
    @post = Post.create(post_params)
    redirect_to "/topics/#{@post.topic.id}"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to topic_path
    else
      render 'edit'
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:body).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end

end

# create
    # @post = Post.new(post_params)
    # @post.save

# update
    # post.update(post_params)
    # redirect_to topic_path
