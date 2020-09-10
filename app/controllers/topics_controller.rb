class TopicsController < ApplicationController
  
  def new
    @topic = Topic.new
  end
  
  def index
    # @topics = Topic.all.order(id: "DESC")
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
      # category_idと紐づく投稿を取得
      @topics = @category.topics.order(created_at: :desc).all
    else
      # 投稿すべてを取得
      @topics = Topic.order(created_at: :desc).all
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @post = Post.new
    @posts = @topic.posts.includes(:user)
    # @posts = Post.find(params[:id])
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