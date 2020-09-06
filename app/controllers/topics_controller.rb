class TopicsController < ApplicationController
  
  def new
    @topic = Topic.new
  end
  
  def index
    @topics = Topic.all.order(id: "DESC")
  end

  def show
    @topic = Topic.find(params[:id])
    @post = Post.new
    @posts = @topic.posts.includes(:user)
    @post = Post.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    redirect_to topics_index_path
  end
end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def update
  #   post = Post.find(params[:id])
  #   post.update(post_params)
  # end



private

def topic_params
  params.permit(:title, :category_id).merge(user_id: current_user.id)
end