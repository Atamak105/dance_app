require 'rails_helper'

RSpec.describe Topic, type: :model do
  before do
    @topic = FactoryBot.build(:topic)
  end

  describe "Topic投稿" do

    context "Topic投稿がうまくいくとき" do
      it "全て入力すれば投稿ができること" do
        expect(@topic).to be_valid
      end
    end

    context "Topic投稿がうまくいかないとき" do
      it "titleが空だと投稿できないこと" do
        @topic.title = nil
        @topic.valid?
        expect(@topic.errors.full_messages).to include("Title can't be blank")
      end
      it "category_idが空だと投稿できないこと" do
        @topic.category_id = nil
        @topic.valid?
        expect(@topic.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが１だと投稿できないこと" do
        @topic.category_id = 1
        @topic.valid?
        expect(@topic.errors.full_messages).to include("Category must be other than 1")
      end
    end

  end

end
