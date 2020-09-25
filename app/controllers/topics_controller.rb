class TopicsController < ApplicationController
  before_action :move_to_login
  
  def new
    @topic = Topic.new
  end
  
  def index
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
      # category_idと紐づく投稿を取得
      @topics = @category.topics.order(created_at: :desc).all
    else
      # 投稿すべてを取得
      @topics = Topic.order(created_at: :desc).all
    end

    @search = Topic.ransack(params[:q])   # 検索機能 Topicテーブルの内容を@searchに代入
    @results = @search.result(distinct: true)  # 結果を@resultへ代入

  end

  def show
    @topic = Topic.find(params[:id])
    @post = Post.new
    @posts = @topic.posts.includes(:user)
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    redirect_to topics_index_path
  end

private

  def topic_params
    params.permit(:title, :category_id).merge(user_id: current_user.id)
  end

  # ログインしていない場合ログイン画面に遷移する
  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

end