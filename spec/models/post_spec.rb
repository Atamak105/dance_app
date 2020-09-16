require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe "post投稿" do

    context "post投稿がうまくいくとき" do
      it "postが入力されていること" do
        expect(@post).to be_valid
      end
    end

    context "postがうまくいかないとき" do
      it "bodyが空だと投稿できないこと" do
        @post.body = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Body can't be blank")
      end
    end

  end

end
